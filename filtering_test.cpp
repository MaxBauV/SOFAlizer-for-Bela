#include <Bela.h>

#include <vector>

#include "filtering.h"
#include "fft.h"
#include "global_variables.h"
#include "position.h"
#include "settings.h"

/**
* Perform FFT on audio input buffer and complex multiplication (using the CPU) with HRTF (already given in frequency domain)
* Max Positions: 
* 
* @param hrtfdata	Object which holds the HRTF data in the frequency domain
* @param incBuff	Circular buffer of audio input data
* @param in_read_ptr		Pointer
* @param outcBuff	Circular buffer of audio output data
* @param out_write_ptr	    Pointer
*/
void filtering_multiple_positions_cpu(std::vector<HRTFData>& hrtfdata, const CircBuff *incBuff, uint32_t in_read_ptr, CircBuff *outcBuff, uint32_t out_write_ptr) {

    m_hrtf_num.lock();
    unsigned int hrtf_num2 = hrtf_num;
    m_hrtf_num.unlock();

    static std::vector<float> unwrappedBuffLeft(FFT_SIZE, 0.0);
    static std::vector<float> unwrappedBuffRight(FFT_SIZE, 0.0);

    /** Unwrap circular buffer */
    for (unsigned int i = 0; i < HOP_SIZE; i++) {
        int in_buff_idx = (in_read_ptr + i - HOP_SIZE + INBUFF_SIZE) % INBUFF_SIZE;
        unwrappedBuffLeft[i] = incBuff->left[in_buff_idx];
        unwrappedBuffRight[i] = incBuff->right[in_buff_idx];
    }

    /** Perform FFT of unwrapped buffers */
    chInL_FFT.fft(unwrappedBuffLeft);
    chInR_FFT.fft(unwrappedBuffRight);

    /**
    * Complex multiplication - CPU
    */
    for (unsigned int i = 0; i < FFT_SIZE; i++) {

        outLeftFFT.fdr(i) = 0;
        outLeftFFT.fdi(i) = 0;
        outRightFFT.fdr(i) = 0;
        outRightFFT.fdi(i) = 0;

        for (unsigned int pos = 0; pos < POSITIONS; pos++) {
            // Input Channel "L"
            outLeftFFT.fdr(i) += (chInL_FFT.fd()[i].r * hrtfdata[hrtf_num2].hrtf_left[pos]->fd()[i].r - chInL_FFT.fd()[i].i * hrtfdata[hrtf_num2].hrtf_left[pos]->fd()[i].i) * VOLUME_FACTOR;
            outLeftFFT.fdi(i) += (chInL_FFT.fd()[i].r * hrtfdata[hrtf_num2].hrtf_left[pos]->fd()[i].i + chInL_FFT.fd()[i].i * hrtfdata[hrtf_num2].hrtf_left[pos]->fd()[i].r) * VOLUME_FACTOR;

            outRightFFT.fdr(i) += (chInL_FFT.fd()[i].r * hrtfdata[hrtf_num2].hrtf_right[pos]->fd()[i].r - chInL_FFT.fd()[i].i * hrtfdata[hrtf_num2].hrtf_right[pos]->fd()[i].i) * VOLUME_FACTOR;
            outRightFFT.fdi(i) += (chInL_FFT.fd()[i].r * hrtfdata[hrtf_num2].hrtf_right[pos]->fd()[i].i + chInL_FFT.fd()[i].i * hrtfdata[hrtf_num2].hrtf_right[pos]->fd()[i].r) * VOLUME_FACTOR;

            // Input Channel "R"
            outLeftFFT.fdr(i) += (chInR_FFT.fd()[i].r * hrtfdata[hrtf_num2].hrtf_left[pos]->fd()[i].r - chInR_FFT.fd()[i].i * hrtfdata[hrtf_num2].hrtf_left[pos]->fd()[i].i) * VOLUME_FACTOR;
            outLeftFFT.fdi(i) += (chInR_FFT.fd()[i].r * hrtfdata[hrtf_num2].hrtf_left[pos]->fd()[i].i + chInR_FFT.fd()[i].i * hrtfdata[hrtf_num2].hrtf_left[pos]->fd()[i].r) * VOLUME_FACTOR;

            outRightFFT.fdr(i) += (chInR_FFT.fd()[i].r * hrtfdata[hrtf_num2].hrtf_right[pos]->fd()[i].r - chInR_FFT.fd()[i].i * hrtfdata[hrtf_num2].hrtf_right[pos]->fd()[i].i) * VOLUME_FACTOR;
            outRightFFT.fdi(i) += (chInR_FFT.fd()[i].r * hrtfdata[hrtf_num2].hrtf_right[pos]->fd()[i].i + chInR_FFT.fd()[i].i * hrtfdata[hrtf_num2].hrtf_right[pos]->fd()[i].r) * VOLUME_FACTOR;
        }  
    }

    /** Inverse FFT */
    outLeftFFT.ifft();
    outRightFFT.ifft();

    if (bypass){
	    /** Write input signal to output buffer  */
	    for (unsigned int i = 0; i < HOP_SIZE; i++) {
	        int outcBuffIdx = (out_write_ptr + i) % OUTBUFF_SIZE;
	        outcBuff->left[outcBuffIdx] = unwrappedBuffLeft[i];
	        outcBuff->right[outcBuffIdx] = unwrappedBuffRight[i];
	    }
    }
    else {
        /** Write filtered signal to output buffer */
        for (unsigned int i = 0; i < FFT_SIZE; i++) {
            int outcBuffIdx = (out_write_ptr + i) % OUTBUFF_SIZE;
            outcBuff->left[outcBuffIdx] += outLeftFFT.td(i);
            outcBuff->right[outcBuffIdx] += outRightFFT.td(i);
        }
    }
}



/**
* Perform FFT on audio input buffer and complex multiplication (using NEON) with HRTF (already given in frequency domain)
* Max Positions: 60
* 
* @param hrtfdata	Object which holds the HRTF data in the frequency domain
* @param incBuff	Circular buffer of audio input data
* @param in_read_ptr		Pointer
* @param outcBuff	Circular buffer of audio output data
* @param out_write_ptr	Pointer
*/
void filtering_multiple_positions_neon(std::vector<HRTFData>& hrtfdata, const CircBuff *incBuff, uint32_t in_read_ptr, CircBuff *outcBuff, uint32_t out_write_ptr) {

    m_hrtf_num.lock();
    unsigned int hrtf_num2 = hrtf_num;
    m_hrtf_num.unlock();

    static std::vector<float> unwrappedBuffLeft(FFT_SIZE, 0.0);
    static std::vector<float> unwrappedBuffRight(FFT_SIZE, 0.0);

    /** Unwrap circular buffer
     *  Extract last WINDOW_SIZE samples into unwrapped Buffer
     */
    for (unsigned int i = 0; i < WINDOW_SIZE; i++) {
        int in_buff_idx = (in_read_ptr + i - WINDOW_SIZE + INBUFF_SIZE) % INBUFF_SIZE;
        unwrappedBuffLeft[i] = incBuff->left[in_buff_idx];
        unwrappedBuffRight[i] = incBuff->right[in_buff_idx];
    }

    /** Perform FFT of unwrapped buffers */
    chInL_FFT.fft(unwrappedBuffLeft);
    chInR_FFT.fft(unwrappedBuffRight);

    /**
    * Complex multiplication - NEON
    * inherited from: "VECTORIZATION OF BINAURAL SOUND VIRTUALIZATION ON THE ARM CORTEX-A15 ARCHITECTURE"; Belloch et al
    */

    float32_t Left1[4], Left2[4], Right1[4], Right2[4];
    float32x4_t L1, L2, R1, R2, C, Hreal, Himag;

    unsigned int cnt = 0;
    for (unsigned int i = 0; i < (FFT_SIZE)/4; i++) {

        /** set to 0 */
        outLeftFFT.fdr(cnt) = 0;
        outLeftFFT.fdi(cnt) = 0;
        outLeftFFT.fdr(cnt+1) = 0;
        outLeftFFT.fdi(cnt+1) = 0;
        outRightFFT.fdr(cnt) = 0;
        outRightFFT.fdi(cnt) = 0;
        outRightFFT.fdr(cnt+1) = 0;
        outRightFFT.fdi(cnt+1) = 0;

        /** process left audio input */
        Left1[0] = chInL_FFT.fd()[cnt].r;
        Left1[1] = chInL_FFT.fd()[cnt].i;
        Left1[2] = chInL_FFT.fd()[cnt+1].r;
        Left1[3] = chInL_FFT.fd()[cnt+1].i;

        /** Load original data input buffer of left channel */
        L1 = vld1q_f32(Left1);

        #if REARRANGE_CPU
            /** Re-arrange (on CPU) data input buffer of left channel */
            Left2[0] = Left1[1];
            Left2[1] = Left1[0];
            Left2[2] = Left1[3];
            Left2[3] = Left1[2];
            /** Load re-arranged data input buffer of left channel */
            L2 = vld1q_f32(Left2);
        #else
            /** Re-arrange (on NEON) data input buffer of left channel */
            L2 = vsetq_lane_f32(vgetq_lane_f32(L1,1),L2,0);
            L2 = vsetq_lane_f32(vgetq_lane_f32(L1,0),L2,1);
            L2 = vsetq_lane_f32(vgetq_lane_f32(L1,3),L2,2);
            L2 = vsetq_lane_f32(vgetq_lane_f32(L1,2),L2,3);
        #endif

        for (unsigned pos = 0; pos < POSITIONS; pos++) {

            /** Load real and imaginary part of left HRTF */
            Hreal = vld1q_f32(hrtfdata[hrtf_num2].hrtf_left_r[pos][i]);
            Himag = vld1q_f32(hrtfdata[hrtf_num2].hrtf_left_i[pos][i]);

            /** Perform complex multiplication */
            C = vmulq_f32(Hreal,L1);
            C = vmlaq_f32(C, L2, Himag);

            /** Write result to left output buffer */
            outLeftFFT.fdr(cnt) += C[0] * VOLUME_FACTOR;
            outLeftFFT.fdi(cnt) += C[1] * VOLUME_FACTOR;
            outLeftFFT.fdr(cnt+1) += C[2] * VOLUME_FACTOR;
            outLeftFFT.fdi(cnt+1) += C[3] * VOLUME_FACTOR;

            /** Load real and imaginary part of right HRTF */
            Hreal=vld1q_f32(hrtfdata[hrtf_num2].hrtf_right_r[pos][i]);
            Himag=vld1q_f32(hrtfdata[hrtf_num2].hrtf_right_i[pos][i]);
        
            /** Perform complex multiplication */
            C=vmulq_f32(Hreal,L1);
            C=vmlaq_f32(C, L2, Himag);

            /** Write result to right output buffer */
            outRightFFT.fdr(cnt) += C[0] * VOLUME_FACTOR;
            outRightFFT.fdi(cnt) += C[1] * VOLUME_FACTOR;
            outRightFFT.fdr(cnt+1) += C[2] * VOLUME_FACTOR;
            outRightFFT.fdi(cnt+1) += C[3] * VOLUME_FACTOR;
        }

        /** process right audio input */
        Right1[0] = chInR_FFT.fd()[cnt].r;
        Right1[1] = chInR_FFT.fd()[cnt].i;
        Right1[2] = chInR_FFT.fd()[cnt+1].r;
        Right1[3] = chInR_FFT.fd()[cnt+1].i;

        /** Load original data input buffer of right channel */
        R1 = vld1q_f32(Right1);

        #if REARRANGE_CPU
            /** Re-arrange (on CPU) data input buffer of right channel */
            Right2[0] = Right1[1];
            Right2[1] = Right1[0];
            Right2[2] = Right1[3];
            Right2[3] = Right1[2];
            /** Load re-arranged data input buffer of right channel */
            R2 = vld1q_f32(Right2);
        #else
            /** Re-arrange (on NEON) data input buffer of right channel */
            R2 = vsetq_lane_f32(vgetq_lane_f32(R1,1),R2,0);
            R2 = vsetq_lane_f32(vgetq_lane_f32(R1,0),R2,1);
            R2 = vsetq_lane_f32(vgetq_lane_f32(R1,3),R2,2);
            R2 = vsetq_lane_f32(vgetq_lane_f32(R1,2),R2,3);
        #endif

        for (unsigned pos = 0; pos < POSITIONS; pos++) {

            /** Load real and imaginary part of left HRTF */
            Hreal = vld1q_f32(hrtfdata[hrtf_num2].hrtf_left_r[pos][i]);
            Himag = vld1q_f32(hrtfdata[hrtf_num2].hrtf_left_i[pos][i]);

            /** Perform complex multiplication */
            C = vmulq_f32(Hreal,R1);
            C = vmlaq_f32(C, R2, Himag);

            /** Write result to left output buffer */
            outLeftFFT.fdr(cnt) += C[0] * VOLUME_FACTOR;
            outLeftFFT.fdi(cnt) += C[1] * VOLUME_FACTOR;
            outLeftFFT.fdr(cnt+1) += C[2] * VOLUME_FACTOR;
            outLeftFFT.fdi(cnt+1) += C[3] * VOLUME_FACTOR;

            /** Load real and imaginary part of right HRTF */
            Hreal=vld1q_f32(hrtfdata[hrtf_num2].hrtf_right_r[pos][i]);
            Himag=vld1q_f32(hrtfdata[hrtf_num2].hrtf_right_i[pos][i]);
        
            /** Perform complex multiplication */
            C=vmulq_f32(Hreal,R1);
            C=vmlaq_f32(C, R2, Himag);

            /** Write result to right output buffer */
            outRightFFT.fdr(cnt) += C[0] * VOLUME_FACTOR;
            outRightFFT.fdi(cnt) += C[1] * VOLUME_FACTOR;
            outRightFFT.fdr(cnt+1) += C[2] * VOLUME_FACTOR;
            outRightFFT.fdi(cnt+1) += C[3] * VOLUME_FACTOR;
        }

        cnt = cnt+2;
    }

    /** Inverse FFT */
    outLeftFFT.ifft();
    outRightFFT.ifft();

    if (bypass){
	    /** Write input signal to output buffer  */
	    for (unsigned int i = 0; i < HOP_SIZE; i++) {
	        int outcBuffIdx = (out_write_ptr + i) % OUTBUFF_SIZE;
	        outcBuff->left[outcBuffIdx] = unwrappedBuffLeft[i];
	        outcBuff->right[outcBuffIdx] = unwrappedBuffRight[i];
	    }
    }
    else {
        /** Write filtered signal to output buffer */
        for (unsigned int i = 0; i < FFT_SIZE; i++) {
            int outcBuffIdx = (out_write_ptr + i) % OUTBUFF_SIZE;
            outcBuff->left[outcBuffIdx] += outLeftFFT.td(i);
            outcBuff->right[outcBuffIdx] += outRightFFT.td(i);
        }
    }
}