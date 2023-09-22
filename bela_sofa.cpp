#include <Bela.h>
#include <mysofa.h>
#include <arm_neon.h>

#include <dirent.h>
#include <string.h>
#include <string>
#if DEBUG_PRINT
    #include <fstream>
#endif

#include "bela_sofa.h"
#include "settings.h"
#include "global_variables.h"

/**
 * Checks if extension of filename is ".sofa".
 * @param filename Filename to test
 * @return True if filename ends with ".sofa", otherwise returns false
 */
bool check_ext(const std::string& filename)
{
    // TODO: test for files such as "bla.sofa.txt" 
    size_t pos = filename.rfind('.');
    if (pos == std::string::npos) {
        return false;
    }

    std::string ext = filename.substr(pos+1);

    if (ext == "sofa") {
        return true;
    }

    return false;
}

/**
 * Finds all ".sofa" files in given directory and loads each sofa structure into an HRTFData object
 *
 * @param hrtfdata Vector of HRTFData objects
 * @param path Path to directory
 * @param HWsampleRate Samplerate of Bela hardware
 * @param max_sofas Maximum number of Sofa structures to load 
 * @return True if directory exists, otherwise returns false
 */
bool read_hrtfs_from_dir(std::vector<HRTFData>& hrtfdata, const char* path, float HWsampleRate, unsigned int max_sofas) {

    DIR *dir;
    struct dirent *ent;
    dir = opendir(path);
    unsigned int cnt = 0;
    char tmp_filename[100];

    if (dir) {
        while ((ent = readdir(dir)) != NULL) {

            if (check_ext(ent->d_name)) {

                if (cnt >= max_sofas) {
                    break;
                }

                // Lists all .sofa files
                strcpy(tmp_filename, path);
                strcat(tmp_filename, ent->d_name);

                HRTFData hrtf(tmp_filename);
                /** Load each SOFA structure */
                hrtf.err = hrtf.load_sofa(HWsampleRate);

                if (hrtf.err == MYSOFA_OK) {
                    hrtfdata.push_back(hrtf);
                    cnt++;
                }

            }
        }
        closedir(dir);
        return true;
    }
    else {
        return false;
    }
}

/**
 * Constructor of HRTFData
 */
HRTFData::HRTFData() {
}

/**
 * Overload constructor of HRTFData
 *
 * @param filepath Relative filepath + filename (e.g. "./HRTFs/test.sofa")
 */
HRTFData::HRTFData(char* filepath) {
    strcpy(filename, filepath);
}

/**
 * Destructor of HRTFData
 */
HRTFData::~HRTFData() {
    //unload_sofa();
}

/**
 * Allocate memory for 3D float32_t arrays holding frequency domain data, optimized for NEON complex multiplication
 * Allocate 3D arrays (each of size [mysofa->M][(FFT_SIZE*2)/4][4])
 *  hrtf_left_r
 *  hrtf_left_i
 *  hrtf_right_r
 *  hrtf_right_i
 */
void HRTFData::allocateFDdata()
{
    hrtf_left_r  = new float32_t**[mysofa->M];
    hrtf_left_i  = new float32_t**[mysofa->M];
    hrtf_right_r = new float32_t**[mysofa->M];
    hrtf_right_i = new float32_t**[mysofa->M];

    for (unsigned int m = 0; m < mysofa->M; m++) {
            hrtf_left_r[m]  = new float32_t*[(FFT_SIZE*2)/4];
            hrtf_left_i[m]  = new float32_t*[(FFT_SIZE*2)/4];
            hrtf_right_r[m] = new float32_t*[(FFT_SIZE*2)/4];
            hrtf_right_i[m] = new float32_t*[(FFT_SIZE*2)/4];

        for (unsigned int n = 0; n < (FFT_SIZE*2)/4; n++) {
            hrtf_left_r[m][n]  = new float32_t[4];
            hrtf_left_i[m][n]  = new float32_t[4];
            hrtf_right_r[m][n] = new float32_t[4];
            hrtf_right_i[m][n] = new float32_t[4];
        }
    }
}

/**
 * Deallocate memory for 3D float32_t arrays holding frequency domain data, optimized for NEON complex multiplication
 * Deallocate 3D arrays (each of size [mysofa->M][(FFT_SIZE*2)/4][4])
 *  hrtf_left_r
 *  hrtf_left_i
 *  hrtf_right_r
 *  hrtf_right_i
 */
void HRTFData::deallocateFDdata()
{
    for (unsigned int m = 0; m < mysofa->M; m++) {
        for (unsigned int n = 0; n < (FFT_SIZE*2)/4; n++) {
            delete[] hrtf_left_r[m][n];
            delete[] hrtf_left_i[m][n];
            delete[] hrtf_right_r[m][n];
            delete[] hrtf_right_i[m][n];
        }
        delete[] hrtf_left_r[m];
        delete[] hrtf_left_i[m];
        delete[] hrtf_right_r[m];
        delete[] hrtf_right_i[m];
    }
    delete[] hrtf_left_r;
    delete[] hrtf_left_i;
    delete[] hrtf_right_r;
    delete[] hrtf_right_i;
}

/**
 * Reformat frequency domain data of HRTF to optimize NEON complex muliplication
 *  frequency domain (FD) data of impulse response (IR) igets reformatted into tuples (float32_t arrays) of size 4
 *  those tuples are stored in an 2D array for each HRTF dataset, resulting in a 3D array
 *  hrtf***  M positions
 *  hrtf**   (N*2)/4
 *  hrtf*    FD data of IR (tuple of size 4)
 *
 *  each hrtf dataset has 4 of those NEON optimized FD 3D arrays:
 *      hrtf_left_r... real part of left receiver = {real[cnt], real[cnt], real[cnt+1], real[cnt+1]}
 *      hrtf_left_i... imag part of left receiver = {-imag[cnt], imag[cnt], -imag[cnt+1], imag[cnt+1]}
 *      hrtf_right_r... real part of right receiver = {real[cnt], real[cnt], real[cnt+1], real[cnt+1]}
 *      hrtf_right_i... imag part of right receiver = {-imag[cnt], imag[cnt], -imag[cnt+1], imag[cnt+1]}
 *
 * data size of FD data optimized for neon doubles compared to FD data
 */
void HRTFData::prepareNeonFDdata()
{
    unsigned int cnt = 0;
    for (unsigned int m = 0; m < mysofa->M; m++) {
        for (unsigned int n = 0; n < (FFT_SIZE*2)/4; n++) {

            hrtf_left_r[m][n][0]   = hrtf_left[m]->fdr(cnt);
            hrtf_left_r[m][n][1]   = hrtf_left[m]->fdr(cnt);
            hrtf_left_r[m][n][2]   = hrtf_left[m]->fdr(cnt+1);
            hrtf_left_r[m][n][3]   = hrtf_left[m]->fdr(cnt+1);

            hrtf_left_i[m][n][0]   = - hrtf_left[m]->fdi(cnt);
            hrtf_left_i[m][n][1]   = hrtf_left[m]->fdi(cnt);
            hrtf_left_i[m][n][2]   = - hrtf_left[m]->fdi(cnt+1);
            hrtf_left_i[m][n][3]   = hrtf_left[m]->fdi(cnt+1);

            hrtf_right_r[m][n][0]   = hrtf_right[m]->fdr(cnt);
            hrtf_right_r[m][n][1]   = hrtf_right[m]->fdr(cnt);
            hrtf_right_r[m][n][2]   = hrtf_right[m]->fdr(cnt+1);
            hrtf_right_r[m][n][3]   = hrtf_right[m]->fdr(cnt+1);

            hrtf_right_i[m][n][0]   = - hrtf_right[m]->fdi(cnt);
            hrtf_right_i[m][n][1]   = hrtf_right[m]->fdi(cnt);
            hrtf_right_i[m][n][2]   = - hrtf_right[m]->fdi(cnt+1);
            hrtf_right_i[m][n][3]   = hrtf_right[m]->fdi(cnt+1);

            cnt = cnt+2;
        }

        cnt = 0;
    }
}

/**
 * Frees allocated FD data
 */
void HRTFData::freeFFTdata() {
    // assuming hrtf_left.size() == hrtf_right.size
    // TODO: check somewhere 

    /** Seallocate fd data of Fft class */
    for (unsigned int i = 0; i < hrtf_left.size(); i++) {
        delete hrtf_left[i];
        delete hrtf_right[i];
    }
    /** Clear vector */
    hrtf_left.clear();
    hrtf_right.clear();
}

/**
 * Loads a single Sofa file into object of HRTFData class
 * Checks if 2 receivers are given, else aborts..
 * To Cartesian
 * Init lookup table
 * HRTF Data get resampled if they do not match Belas samplerate
 * 
 * @param hwSampleRate Samplerate of Bela device
 * @return Error Code (see Enums in mysofa.h & BelaSofa.h)
 */
int HRTFData::load_sofa(float hwSampleRate)
{
    int error = MYSOFA_OK;

    /** Load a single sofa file */
    mysofa = mysofa_load(filename, &err);

    if (error == MYSOFA_OK) {

        error = mysofa_check(mysofa);
        if (error == MYSOFA_OK) {
            if (mysofa->R != 2) {
                error = MYSOFA_INVALID_RECEIVER_COUNT;
            }
            else {
                /**
                 * obtain radius
                 */
                /** check if sofa is spherical */
                if (strcmp(mysofa->SourcePosition.attributes->next->value, "spherical") == 0) {
                //if (verifyAttribute(mysofa->SourcePosition.attributes, "Type", "spherical")) {
                    /** check if spherical unit are supported (degree, degree, meter)*/
                    if (strcmp(mysofa->SourcePosition.attributes->value, "degree, degree, meter") == 0 ||
                        strcmp(mysofa->SourcePosition.attributes->value, "degree, degree, metre") == 0) {
                        radius = mysofa->SourcePosition.values[((mysofa->SourcePosition.elements/3)*2)+1];
                    }
                    else {
                        error = MYSOFA_UNSUPPORTED_SPHERICAL_UNITS;
                    }
                }
                else {
                    error = MYSOFA_NOT_SPHERICAL;
                }

                /** Find index for frontal position */
                frontal_position_index = 0;

                for (unsigned int i = 0; i + 2 < mysofa->SourcePosition.elements; i += mysofa->C) {
                    if (mysofa->SourcePosition.values[i] == 0 && mysofa->SourcePosition.values[i+1] == 0) {
                        frontal_position_index = i / mysofa->C;
                    }
                }

                /** Convert to cartesian - needed for lookup */
                mysofa_tocartesian(mysofa);
                /** initialize lookup table */
                mylookup = mysofa_lookup_init(mysofa);
                if (mylookup) {
                    /** initialize neighborhood table */
                    myneighborhood = mysofa_neighborhood_init(mysofa, mylookup);
                    /** resample if required */
                    if (mysofa->DataSamplingRate.values[0] != hwSampleRate) {
                        error = mysofa_resample(mysofa, hwSampleRate);
                    }
                }
                else {
                    error = MYSOFA_LOOKUP_INIT_ERR;
                }
            }
        }
    }

    return error;
}

/**
 * Performs a FFT on time domain HRTF data
 * M = Measurement count (IR count)
 * R = Receivers (only 2 are supported)
 * N = Sample length of each Measurement (IR)
 */
void HRTFData::sofaFFT () {

    /** Vector which prepares the IR data for FFT transform (for each spatial positions for each receiver) */
    std::vector<float> tmpZP (FFT_SIZE, 0.0);

    /** Counters for M and R */
    unsigned int m = 0;
    unsigned int r = 0;

    unsigned int newN;

    hrtf_left.resize(mysofa->M);
    hrtf_right.resize(mysofa->M);

    // rt_printf("filename = %s\n", filename);
    // rt_printf("N=%d, ((FFT_SIZE/2)-1)=%d\n", mysofa->N, ((FFT_SIZE/2)-1));

    if (mysofa->N > ((FFT_SIZE/2)-1)) {
        newN = ((FFT_SIZE/2)-1);
        rt_printf("triggering N>FFT/2-1\n");
    }
    else {
        newN = (mysofa->N-1);
    }

    #if DEBUG_PRINT
        std::string log_extension = "_td_data.log";
        std::ofstream tdFile(filename + log_extension);
        tdFile << "TD Data of " << filename << "\n";
    #endif

    for (unsigned int i = 0; i < mysofa->DataIR.elements; i+= mysofa->N) {
        memcpy(&tmpZP[0], &mysofa->DataIR.values[i], (newN+1) * sizeof(float));

        Fft *fftobj = new Fft;
        fftobj->setup(FFT_SIZE);

        fftobj->fft(tmpZP);

        /** Toggle between left and right channel */
        if (r == 0) {
                #if DEBUG_PRINT
                    for (unsigned j = 0; j < FFT_SIZE; j++) {
                        tdFile << "[" << m << "][" << j << "] Left: "  << tmpZP[j] << "\n";
                    }
                #endif
            hrtf_left[m] = fftobj;
            r++;
        }
        else {
                #if DEBUG_PRINT
                    for (unsigned j = 0; j < FFT_SIZE; j++) {
                        tdFile << "[" << m << "][" << j << "] Right "  << tmpZP[j] << "\n";
                    }
                #endif
            hrtf_right[m] = fftobj;
            r = 0;
            m++;
        }
    }
    #if DEBUG_PRINT
        tdFile.close();
    #endif
}


/**
 * Unload Sofa structures & free memory
 */
void HRTFData::unload_sofa ()
{
    mysofa_free(mysofa);
    mysofa_lookup_free(mylookup);
    mysofa_neighborhood_free(myneighborhood);
}

/**
 * Normalizes time domain impulse response data
 * @param normalization_percentage volume after normalization (valid range: 0...1)
 *      no normalization will be performed if normalization_percentage is 0
 * @return
 *      -1 = error
 *       0 = no normalization performed
 *       1 = normalization performed
 */
int HRTFData::normalizeTDdata(float normalization_percentage) {

    /** check for invalid range */
    if (normalization_percentage > 1 || normalization_percentage < 0) {
        return -1;
    }
    /** skip normalization */
    else if (normalization_percentage == 0) {
        return 0;
    }
    /** perform normalization */
    else {
        float factor;
        float max = 0;

        /** Search maximum value in frontal position */
        int search_start = frontal_position_index * mysofa->N * mysofa->R;
        int search_end   = frontal_position_index * mysofa->N * mysofa->R + mysofa->N * mysofa->R;

        for (unsigned int i = search_start; i < search_end; i++) {
            if (fabsf(mysofa->DataIR.values[i]) > max) {
                max = fabsf(mysofa->DataIR.values[i]);
            }
        }

        factor = normalization_percentage / max;

        for (unsigned int i = 0; i < mysofa->DataIR.elements; i++) {
            mysofa->DataIR.values[i] = mysofa->DataIR.values[i] * factor;
        }

        return 1;
    }
}
