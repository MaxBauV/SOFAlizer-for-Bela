#include <Bela.h>

#include <vector>
#include <mutex>

#include "filtering.h"
#include "fft.h"
#include "global_variables.h"
#include "position.h"
#include "settings.h"

#define PRINT_POS 0

/**
* Perform FFT on audio input buffer and complex multiplication (using NEON) with HRTF (already given in frequency domain)
* Max Positions: 60
* 
* @param hrtfdata	    Object which holds the HRTF data in the frequency domain
* @param incBuff	    Circular buffer of audio input data
* @param in_read_ptr	Pointer
* @param outcBuff	    Circular buffer of audio output data
* @param out_write_ptr  Pointer
*/
void filtering(std::vector<HRTFData>& hrtfdata, const CircBuff *incBuff, uint32_t in_read_ptr, CircBuff *outcBuff, uint32_t out_write_ptr) {

    m_hrtf_num.lock();
    unsigned int hrtf_num2 = hrtf_num;
    m_hrtf_num.unlock();

    static std::vector<float> unwrappedBuffLeft(FFT_SIZE, 0.0);
    static std::vector<float> unwrappedBuffRight(FFT_SIZE, 0.0);

    int nearestChInL = 0;
    int nearestChInR = 0;

    /** Unwrap circular buffer */
    for (unsigned int i = 0; i < (WINDOW_SIZE); i++) {
        int in_buff_idx = (in_read_ptr + i - (WINDOW_SIZE) + INBUFF_SIZE) % INBUFF_SIZE;
        unwrappedBuffLeft[i] = incBuff->left[in_buff_idx];
        unwrappedBuffRight[i] = incBuff->right[in_buff_idx];
    }

    /** Perform FFT of unwrapped buffers */
    chInL_FFT.fft(unwrappedBuffLeft);
    chInR_FFT.fft(unwrappedBuffRight);

    float tmp_leftCartesian[3];
    float tmp_righCartesian[3];

    m_left_pos.lock();
    {
        /** Obtain radius from hrtf_file */
        leftPosition.radius = hrtfdata[hrtf_num2].radius;
        /** Convert spherical to cartesian */
        leftPosition.s2c();
        /** Convert to cartesian in format for lookup() */
        tmp_leftCartesian[0] = leftPosition.x;
        tmp_leftCartesian[1] = leftPosition.y;
        tmp_leftCartesian[2] = leftPosition.z;
    }
    m_left_pos.unlock();

    m_right_pos.lock();
    {
        /** Obtain radius from leftPosition */
        righPosition.radius = leftPosition.radius;
        /** Convert spherical to cartesian */
        righPosition.s2c();
        /** Convert to cartesian in format for lookup() */
        tmp_righCartesian[0] = righPosition.x;
        tmp_righCartesian[1] = righPosition.y;
        tmp_righCartesian[2] = righPosition.z;
    }
    m_right_pos.unlock();


    #if PRINT_POS
        rt_printf("L: r=%f, a=%f, i=%f, x=%f, y=%f, z=%f\n", leftPosition.radius, leftPosition.azimuth, leftPosition.elevation_angle, leftPosition.x, leftPosition.y, leftPosition.z);
        rt_printf("R: r=%f, a=%f, i=%f, x=%f, y=%f, z=%f\n", righPosition.radius, righPosition.azimuth, righPosition.elevation_angle, righPosition.x, righPosition.y, righPosition.z);
    #endif

    /** Get specified position */
    nearestChInL = mysofa_lookup(hrtfdata[hrtf_num2].mylookup, tmp_leftCartesian);
    nearestChInR = mysofa_lookup(hrtfdata[hrtf_num2].mylookup, tmp_righCartesian);

    #if PRINT_POS
        rt_printf("L: %d; R: %d\n", nearestChInL, nearestChInR);
        if (nearestChInL == -1) {
            rt_printf("Error at finding nearestChInL IR\n");
        }
        if (nearestChInR == -1) {
            rt_printf("Error at finding nearestChInR IR\n");
        }
    #endif

    /**
    * Complex multiplication - NEON
    * inherited from: "VECTORIZATION OF BINAURAL SOUND VIRTUALIZATION ON THE ARM CORTEX-A15 ARCHITECTURE"; Belloch et al
    */

    float32_t Left1[4], Left2[4], Right1[4], Right2[4];
    float32x4_t L1, L2, R1, R2, C, Hreal, Himag;

    unsigned int cnt = 0;
    for (unsigned int i = 0; i < (FFT_SIZE)/4; i++) {

        /** process left audio input */
        Left1[0] = chInL_FFT.fd()[cnt].r;
        Left1[1] = chInL_FFT.fd()[cnt].i;
        Left1[2] = chInL_FFT.fd()[cnt+1].r;
        Left1[3] = chInL_FFT.fd()[cnt+1].i;

        Left2[0] = Left1[1];
        Left2[1] = Left1[0];
        Left2[2] = Left1[3];
        Left2[3] = Left1[2];

        /** Load original and re-arranged data input buffer of left channel */
        L1 = vld1q_f32(Left1);
        L2 = vld1q_f32(Left2);

        /** Load real and imaginary part of left HRTF */
        Hreal = vld1q_f32(hrtfdata[hrtf_num2].hrtf_left_r[nearestChInL][i]);
        Himag = vld1q_f32(hrtfdata[hrtf_num2].hrtf_left_i[nearestChInL][i]);

        /** Perform complex multiplication */
        C = vmulq_f32(Hreal,L1);
        C = vmlaq_f32(C, L2, Himag);

        /** Write result to left output buffer */
        outLeftFFT.fdr(cnt) = C[0];
        outLeftFFT.fdi(cnt) = C[1];
        outLeftFFT.fdr(cnt+1) = C[2];
        outLeftFFT.fdi(cnt+1) = C[3];

        /** Load real and imaginary part of right HRTF */
        Hreal=vld1q_f32(hrtfdata[hrtf_num2].hrtf_right_r[nearestChInL][i]);
        Himag=vld1q_f32(hrtfdata[hrtf_num2].hrtf_right_i[nearestChInL][i]);
    
        /** Perform complex multiplication */
        C = vmulq_f32(Hreal,L1);
        C = vmlaq_f32(C, L2, Himag);

        /** Write result to right output buffer */
        outRightFFT.fdr(cnt) = C[0];
        outRightFFT.fdi(cnt) = C[1];
        outRightFFT.fdr(cnt+1) = C[2];
        outRightFFT.fdi(cnt+1) = C[3];

        /** process right audio input */
        Right1[0] = chInR_FFT.fd()[cnt].r;
        Right1[1] = chInR_FFT.fd()[cnt].i;
        Right1[2] = chInR_FFT.fd()[cnt+1].r;
        Right1[3] = chInR_FFT.fd()[cnt+1].i;

        Right2[0] = Right1[1];
        Right2[1] = Right1[0];
        Right2[2] = Right1[3];
        Right2[3] = Right1[2];

        /** Load original and re-arranged data input buffer of right channel */
        R1 = vld1q_f32(Right1);
        R2 = vld1q_f32(Right2);

        /** Load real and imaginary part of left HRTF */
        Hreal = vld1q_f32(hrtfdata[hrtf_num2].hrtf_left_r[nearestChInR][i]);
        Himag = vld1q_f32(hrtfdata[hrtf_num2].hrtf_left_i[nearestChInR][i]);

        /** Perform complex multiplication */
        C = vmulq_f32(Hreal,R1);
        C = vmlaq_f32(C, R2, Himag);

        /** Write result to left output buffer */
        outLeftFFT.fdr(cnt) += C[0];
        outLeftFFT.fdi(cnt) += C[1];
        outLeftFFT.fdr(cnt+1) += C[2];
        outLeftFFT.fdi(cnt+1) += C[3];

        /** Load real and imaginary part of right HRTF */
        Hreal=vld1q_f32(hrtfdata[hrtf_num2].hrtf_right_r[nearestChInR][i]);
        Himag=vld1q_f32(hrtfdata[hrtf_num2].hrtf_right_i[nearestChInR][i]);
    
        /** Perform complex multiplication */
        C=vmulq_f32(Hreal,R1);
        C=vmlaq_f32(C, R2, Himag);

        /** Write result to right output buffer */
        outRightFFT.fdr(cnt) += C[0];
        outRightFFT.fdi(cnt) += C[1];
        outRightFFT.fdr(cnt+1) += C[2];
        outRightFFT.fdi(cnt+1) += C[3];

        cnt = cnt + 2;
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