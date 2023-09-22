#ifndef BELA_SOFA_H
#define BELA_SOFA_H

#include <mysofa.h>
#include <arm_neon.h>

#include <vector>
#include <string>

#include "fft.h"


/** class for HRTF data */
class HRTFData
{
    public:
        /** Filename of SOFA path */
        char filename[100];

        /** Stores the SOFA structure */
        MYSOFA_HRTF* mysofa;
        /** For the lookup */
        MYSOFA_LOOKUP* mylookup;
        MYSOFA_NEIGHBORHOOD* myneighborhood;

        /** Radius of HRTF measurement */
        float radius;
        /** Error code */
        int err;

        /** FD data of Fft class */
        std::vector<Fft*> hrtf_left;
        std::vector<Fft*> hrtf_right;

        /** FD data converted from Fft class to format optimized for NEON complex multiplication */
        float32_t*** hrtf_left_r;
        float32_t*** hrtf_left_i;
        float32_t*** hrtf_right_r;
        float32_t*** hrtf_right_i;

        unsigned int frontal_position_index;

        /** constructor, overload constructor & destructor */
        HRTFData();
        HRTFData(char* filepath);
        ~HRTFData();

        /** Load SOFA structure */
        int load_sofa(float hwSampleRate);
        /** Unload SOFA structure*/
        void unload_sofa();
        /** Perform FFT on HRTFs (using Fft class) */
        void sofaFFT();
        /** Allocate memory for hrtf_left_r, hrtf_left_i, hrtf_right_r, hrtf_right_i */
        void allocateFDdata();
        /** Deallocate memory for hrtf_left_r, hrtf_left_i, hrtf_right_r, hrtf_right_i */
        void deallocateFDdata();
        /** Convert FD data from Fft format to format optimized for NEON complex multiplication */
        void prepareNeonFDdata();
        /** Free FD data of Fft class */
        void freeFFTdata();

        int normalizeTDdata(float normalization_percentage);
};

/** Function Prototypes */
bool read_hrtfs_from_dir(std::vector<HRTFData>& hrtfdata, const char* path, float HWsampleRate, unsigned int max_sofas);
bool check_ext(const std::string& filename);

/** Additional Error Code enums (additional to enums of mysofa.h) */
enum {
    MYSOFA_INVALID_RECEIVER_COUNT = -2,
    MYSOFA_LOOKUP_INIT_ERR = -3,
    MYSOFA_NOT_SPHERICAL = -4,
    MYSOFA_UNSUPPORTED_SPHERICAL_UNITS = -5
};

#endif