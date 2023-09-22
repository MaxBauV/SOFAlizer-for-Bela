#include <Bela.h>

#include <vector>
#include <mutex>

#include "settings.h"
#include "position.h"
#include "circular_buffer.h"
#include "fft.h"
#include "analog_interface.h"
#include "osc.h"
#include "filtering.h"
#include "bela_sofa.h"

#include "filtering_test.h"

/*----------------- GLOBAL VARIABLES DEFINITIONS -----------------*/

/** Vector holding all HRTFData objects (= SOFA structures) */
std::vector<HRTFData> hrtfdata;

/** Object holding the given position (spherical & cartesian) */
Position leftPosition;
Position righPosition;
std::mutex m_left_pos;
std::mutex m_right_pos;

/** Circular input & output buffer */
CircBuff incBuff;
CircBuff outcBuff;

/** Read & write pointer for circular input & output buffers */
uint32_t incWritePtr = 0;
uint32_t out_write_ptr = HOP_SIZE;
uint32_t outcReadPtr = 0;
uint32_t cached_in_read_ptr = 0;

/** Hop counter */
uint32_t hopCnt = 0;

/** Object holding the fd (frequency domain) data of audio input */
Fft chInL_FFT;
Fft chInR_FFT;

/** Object holding the fd (frequency domain) data for audio output */
Fft outLeftFFT;
Fft outRightFFT;

#if INTERFACE == ANALOG
	/** Object for Analog Control Interface */
	AnalogInterface anInterface;
#else
	/** Object of OSC Control Interface */
	OSCinterface oscInterface;
	bool send_pos_0;
	bool send_pos_1;
#endif

/** Values to set active HRTFData objects (= SOFA structures) */
unsigned int hrtf_cnt = 0;
unsigned int hrtf_num = 0;
std::mutex m_hrtf_num;
unsigned int hrtf_num_prev = 1;

/** Bypass toggle - bypass spatialization while keeping CPU load similar */
bool bypass = false;

/*----------------- END GLOBAL VARIABLES DEFINITIONS -----------------*/


/*----------------- THREAD DEFINITIONS -----------------*/
/** Thread for FFT processing */
AuxiliaryTask filteringTask;
/*----------------- END THREAD DEFINITIONS -----------------*/


/*----------------- FUNCTION PROTOTYPES -----------------*/
void filtering_thread(void *);
//void osc_on_receive(oscpkt::Message* msg, const char* addr, void* arg);
/*----------------- END FUNCTION PROTOTYPES -----------------*/



/**
 * Load multiple Sofa structures & perform FFT on it,
 * Setup circular buffers,
 * Setup Fft of audio input
 * 
 * @param context
 * @param userData
 * @return 
*/
bool setup(BelaContext *context, void *userData)
{
	int normalization_status = 2;

	#if INTERFACE == ANALOG
		/** Configure Button & LED pins */
		pinMode(context, 0, INC_BUTTON, INPUT);
		pinMode(context, 0, DEC_BUTTON, INPUT);
		pinMode(context, 0, BYPASS_BUTTON, INPUT);
		pinMode(context, 0, 8, OUTPUT);
		pinMode(context, 0, 5, OUTPUT);
	#else
		/** Setup of OSC Sender */
		oscInterface.oscSender.setup(oscInterface.remotePort, oscInterface.remoteIP);
		oscInterface.send_status("Started..");
		send_pos_0 = false;
		send_pos_1 = true;
	#endif

	rt_printf("HW Sample Rate: %5.0f Hz\n", context->audioSampleRate);

	/** Load all sofa files from HRTF_DIR */
	if (!read_hrtfs_from_dir(hrtfdata, HRTF_DIR, context->audioSampleRate, MAX_SOFAS)){
		rt_printf("Could not find %s\n", HRTF_DIR);
		//oscInterface.send_status("Could not find" << HRTF_DIR);
	}

	#if INTERFACE != ANALOG
		oscInterface.send_status("Loaded all HRTFs");
	#endif

	/** Perform Normalization & FFT on all fft data */
	for (int i = 0; i < hrtfdata.size(); i++) {
		if (hrtfdata[i].err == MYSOFA_OK) {

			/** Normalize */
			normalization_status = hrtfdata[i].normalizeTDdata(NORMALIZATION_PERCENT);
			if (normalization_status == -1) {
				rt_printf("Wrong normalization percentage (change \"NORMALIZATION_PERCENT\" in settings.h to a value between 0 and 1)\n");
			}
			else if (normalization_status == 0) {
				rt_printf("Did not perform normalization on %s\n", hrtfdata[i].filename);
			}
			else if (normalization_status == 1) {
				rt_printf("Performed normalization on %s\n", hrtfdata[i].filename);
			}

			/** Perform FFT */
			hrtfdata[i].sofaFFT();
			#if DEBUG_PRINT
				fftToFile(&hrtfdata[i]);
			#endif
			#if CM_METHOD == CM_NEON
				hrtfdata[i].allocateFDdata();
				hrtfdata[i].prepareNeonFDdata();
				hrtfdata[i].freeFFTdata();
			#endif
		}
		else {
			rt_printf("Err: %d, Could not load %s\n", hrtfdata[i].err, hrtfdata[i].filename);
			try {
				hrtfdata[i].unload_sofa();
			}
			catch(...) {}
		}
	}

	#if INTERFACE != ANALOG
		oscInterface.send_status("Performed FFT on all HRTFs");
	#endif

	/** Resize circular input Buffer accordingly */
	incBuff.left.resize(INBUFF_SIZE);
	incBuff.right.resize(INBUFF_SIZE);

	/** Resize circular output Buffer accordingly */
	outcBuff.left.resize(OUTBUFF_SIZE);
	outcBuff.right.resize(OUTBUFF_SIZE);

	/** Setup of Fft objects used for audio input data FFT */
	chInL_FFT.setup(FFT_SIZE);
	chInR_FFT.setup(FFT_SIZE);

	outLeftFFT.setup(FFT_SIZE);
	outRightFFT.setup(FFT_SIZE);

	/** Initialize filtering thread */
	filteringTask = Bela_createAuxiliaryTask(filtering_thread, 50, "SOFAlizer-filtering-task");

	#if INTERFACE != ANALOG
		/** Setup for OSC Receiver */
		oscInterface.oscReceiver.setup(oscInterface.localPort, osc_on_receive);
	#endif

	/** Set hrtf_cnt to number of loaded HRTFs and select last HRTF data set by setting hrtf_num to (hrtf_cnt-1) */
	hrtf_cnt = hrtfdata.size();
	m_hrtf_num.lock();
	hrtf_num = (hrtf_cnt-1);
	m_hrtf_num.unlock();

	#if INTERFACE != ANALOG
		oscInterface.send_filename(hrtfdata[hrtf_num].filename);
		oscInterface.send_status("Running..");
	#endif

	return true;
}

/**
 * Multithread wrapper for filtering process
*/
void filtering_thread(void *) {
	#if CM_METHOD == CM_CPU
		filtering_multiple_positions_cpu(hrtfdata, &incBuff, cached_in_read_ptr, &outcBuff, out_write_ptr);
	#elif CM_METHOD == CM_NEON
		filtering_multiple_positions_neon(hrtfdata, &incBuff, cached_in_read_ptr, &outcBuff, out_write_ptr);
	#endif
	//filtering(hrtfdata, &incBuff, cached_in_read_ptr, &outcBuff, out_write_ptr);

	/** Update the output buffer write pointer to start at next hop */
	out_write_ptr = (out_write_ptr + HOP_SIZE) % INBUFF_SIZE;
}


void render(BelaContext *context, void *userData)
{
	for (unsigned int i = 0; i < context->audioFrames; i++) {

		/** Overwrite the buffer at the write pointer */
		incBuff.left[incWritePtr] = audioRead(context, i, 0);
		incBuff.right[incWritePtr] = audioRead(context, i, 1);

		/** Increment input-buffer write pointer and reset if at end of circular buffer */
		incWritePtr++;
		if (incWritePtr >= INBUFF_SIZE) {
			incWritePtr = 0;
		}

		/** Get output sample from output Buffer */
		float leftOut = outcBuff.left[outcReadPtr];
		float rightOut = outcBuff.right[outcReadPtr];

		/** Clear output sample in buffer */
		outcBuff.left[outcReadPtr] = 0;
		outcBuff.right[outcReadPtr] = 0;

		/** Scale down output by overlap factor (how many windows overlap) */
		float factor = (float) HOP_SIZE / (float) FFT_SIZE;
		leftOut *= factor;
		rightOut *= factor;

		/** Increment output-buffer read pointer and reset if end of circular buffer is reached */
		outcReadPtr++;
		if (outcReadPtr >= OUTBUFF_SIZE) {
			outcReadPtr = 0;
		}

		#if INTERFACE == ANALOG
			/** Get Potentiometer Values */
			anInterface.read(context, 0);
			/** Set position according to potentiometer value */
			m_left_pos.lock();
			leftPosition.azimuth 		 = anInterface.leftAzimuthPot.currentValue;
			leftPosition.elevation_angle = anInterface.leftElevationPot.currentValue;
			m_left_pos.unlock();
			m_right_pos.lock();
			righPosition.azimuth 		 = anInterface.rightAzimuthPot.currentValue;
			righPosition.elevation_angle = anInterface.rightElevationPot.currentValue;
			m_right_pos.unlock();
		#endif

		/** Start a new fft when hop size is reached & reset hop counter */
		hopCnt++;
		if (hopCnt >= HOP_SIZE) {
			hopCnt = 0;
			cached_in_read_ptr = incWritePtr;
			Bela_scheduleAuxiliaryTask(filteringTask);
		}

		/** Write to audio output */
		audioWrite(context, i, 0, leftOut);
		audioWrite(context, i, 1, rightOut);

		/** Choose HRTF set (toggle between different SOFAs) */
		#if INTERFACE == ANALOG

			/** Read buttons */
			anInterface.incButtonValueCurr = digitalRead(context, i, INC_BUTTON);
			anInterface.decButtonValueCurr = digitalRead(context, i, DEC_BUTTON);
			anInterface.bypassButtonValueCurr = digitalRead(context, i, BYPASS_BUTTON);

			/** Falling edge detection for increment button */
			if (anInterface.incButtonValueCurr == false && anInterface.incButtonValuePrev == true) {
				/** Increment HRTF set */
				m_hrtf_num.lock();
				hrtf_num++;
				if (hrtf_num == hrtf_cnt) {
                	hrtf_num = 0;
            	}
				m_hrtf_num.unlock();
			}

			/** Falling edge detection for decrement button */
			if (anInterface.decButtonValueCurr == false && anInterface.decButtonValuePrev == true) {
				/** Decrement HRTF set */
				m_hrtf_num.lock();
				hrtf_num--;
				if (hrtf_num == -1) {
					hrtf_num = hrtf_cnt-1;
				}
				m_hrtf_num.unlock();
			}

			/** Falling edge detection for bypass button */
			if (anInterface.bypassButtonValueCurr == false && anInterface.bypassButtonValuePrev == true) {
				/** Invert bypass state */
				bypass = !bypass;
			}

			/** Store current button value as previous one */
			anInterface.incButtonValuePrev = anInterface.incButtonValueCurr;
			anInterface.decButtonValuePrev = anInterface.decButtonValueCurr;
			anInterface.bypassButtonValuePrev = anInterface.bypassButtonValueCurr;

		#endif

		/** Visual feedback on currently chosen HRTF set */
		if (hrtf_num != hrtf_num_prev) {
			#if INTERFACE == ANALOG
				rt_printf("%s\n", hrtfdata[hrtf_num].filename);
			#else
				oscInterface.send_hrtf_num(hrtf_num);
				oscInterface.send_filename(hrtfdata[hrtf_num].filename);
			#endif

			hrtf_num_prev = hrtf_num;
		}

		/** Send current position via OSC */
		#if INTERFACE == OSC
			if (send_pos_0) {
				oscInterface.get_angle_pos0();
				send_pos_0 = false;
			}
			if (send_pos_1) {
				oscInterface.get_angle_pos1();
				send_pos_1 = false;
			}
		#endif
	}
}

/**
 * Unload all HRTFData objects & deallocate memory
 *
 */
void cleanup(BelaContext *context, void *userData)
{
	//TODO: check if other ressources need de-allocation
	for (unsigned int i = 0; i < hrtfdata.size(); i++) {
		hrtfdata[i].unload_sofa();

		#if CM_METHOD == CP_CPU
			hrtfdata[i].freeFFTdata();
		#else
			hrtfdata[i].deallocateFDdata();
		#endif
	}
}