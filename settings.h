#ifndef SETTINGS_H
#define SETTINGS_H

/** Creates files of time domain and frequency domain data of each HRTF set, if set to true */
#define DEBUG_PRINT false

/** Maximum HRTFs to be loaded */
#define MAX_SOFAS 1

#define HOP_SIZE 256
#define FFT_SIZE (HOP_SIZE * 2)
#define INBUFF_SIZE 1024  // min: FFT_SIZE + HOP_SIZE
#define OUTBUFF_SIZE 1024 // min: FFT_SIZE + HOP_SIZE

#define HRTF_DIR "./HRTFs/\0"

#define NORMALIZATION_PERCENT 0.9
#define VOLUME ((float) HOP_SIZE / (float) FFT_SIZE)

/** Choose Interface
 *  Set INTERFACE to ANALOG or OSC
 */
#define INTERFACE OSC

/** Azimuth & Elevation ranges */
#define RANGE_MIN_AZI 0
#define RANGE_MAX_AZI 360
#define RANGE_MIN_ELE -30
#define RANGE_MAX_ELE 90

/** OSC Interface Defines */
#define LOCAL_PORT  7562
#define REMOTE_PORT 7563
#define REMOTE_IP "192.168.0.115"

/* ----------- DO NOT CHANGE THE FOLLOWING DEFINES!!! ----------- */

/** Options for INTERFACE & FFT_METHOD */
#define OSC 1
#define ANALOG 2
#define FFT_CPU 1
#define FFT_NEON 2
#define CM_CPU 1
#define CM_NEON 2

/** Buttons for Analog Interface (Pepper Shield) */
#define INC_BUTTON 12
#define DEC_BUTTON 13
#define BYPASS_BUTTON 15

/** Potntiometers for Analog Interface (Pepper Shield) */
#define POT_LEFT_AZI  0   /** Bela Pepper: Top Left */
#define POT_LEFT_ELE  1   /** Bela Pepper: Top Right */
#define POT_RIGHT_AZI 2   /** Bela Pepper: Below Top Left */
#define POT_RIGHT_ELE 3   /** Bela Pepper: Below Top Right */

/* -------- END : DO NOT CHANGE THE FOLLOWING DEFINES!!! -------- */



/* -------------------- DEFINES FOR TESTING --------------------- */

/** Pre-compiler macros for effiency testing, where the maximum number of positions (virtual loudspeakers) is evaluated.
 *  At this state the macros influence filtering_test.cpp and fft.cpp
 */

/** Choose Method for FFT
 *  Set FFT_METHOD to FFT_CPU or FFT_NEON
 */
#define FFT_METHOD FFT_NEON 

/** Choose Method for complex multiplication (CM)
 *  Set CM_METHOD to CM_CPU or CM_NEON
 */
#define CM_METHOD CM_NEON

/** Maximimum Position per Channel */
#define POSITIONS 36

/** Re-arrange input data buffer if CM_METHOD = CM_NEON, 
 *  re-arringing either done with NEON (REARRANGE_CPU = false) or CPU (REARRANGE_CPU = true) */
#define REARRANGE_CPU true

/** Volume scaling factors
 *  to avoid clipping when using multiple positions
 */
#define VOLUME_FACTOR (1 / (float) POSITIONS);

/* ------------------ END: DEFINES FOR TESTING ------------------ */

#endif