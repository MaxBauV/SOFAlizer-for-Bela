#include <mutex>

#include "bela_sofa.h"
#include "position.h"
#include "circular_buffer.h"
#include "fft.h"
#include "analog_interface.h"
#include "osc.h"


/*----------------- GLOBAL VARIABLES DECLARATIONS -----------------*/

/** Vector holding all HRTFData objects (= SOFA structures) */
extern std::vector<HRTFData> hrtfdata;

/** Object holding the given position (spherical & cartesian) */
extern Position leftPosition;
extern Position righPosition;
extern std::mutex m_left_pos;
extern std::mutex m_right_pos;

/** Circular input & output buffer */
extern CircBuff incBuff;
extern CircBuff outcBuff;

/** Read & write pointer for circular input & output buffers */
extern uint32_t incWritePtr;
extern uint32_t out_write_ptr;
extern uint32_t outcReadPtr;
extern uint32_t cached_in_read_ptr;

/** Hop counter */
extern uint32_t hopCnt;

/** Object holding the fd (frequency domain) data of audio input */
extern Fft chInL_FFT;
extern Fft chInR_FFT;

/** Object holding the fd (frequency domain) data for audio output */
extern Fft outLeftFFT;
extern Fft outRightFFT;

#if INTERFACE == ANALOG
	/** Object for Analog Control Interface */
	extern AnalogInterface anInterface;
#else
	/** Object of OSC Control Interface */
	extern OSCinterface oscInterface;
	extern bool send_pos_0;
	extern bool send_pos_1;
#endif

/** Values to set active HRTFData objects (= SOFA structures) */
extern unsigned int hrtf_cnt;
extern unsigned int hrtf_num;
extern std::mutex m_hrtf_num;
extern unsigned int hrtf_num_prev;

/** Bypass */
extern bool bypass;

/*----------------- END GLOBAL VARIABLES DECLARATIONS -----------------*/