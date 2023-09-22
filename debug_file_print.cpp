#include <iostream>
#include <fstream>
#include <vector>
#include <iomanip>

#include "bela_sofa.h"

//includes not checked

#define DEC_DIGIT 6

void fftToFile (const HRTFData *hrtfdata) {
    std::string filename = hrtfdata->filename;
    std::string log_extension = "_fft_data.log";
    std::ofstream fftFile(filename + log_extension);

    fftFile << "FFT Data\n";
    fftFile << "M x R x N = " << hrtfdata->mysofa->M << " x " << hrtfdata->mysofa->R << " x " << hrtfdata->mysofa->N << "\n";
    fftFile << "M x R x N (actual) = " << hrtfdata->hrtf_left.size() << " x 2 x " << hrtfdata->hrtf_left[0]->get_length() << "\n";
    fftFile << "elements = " << hrtfdata->mysofa->DataIR.elements << "\n";


    for (unsigned int m = 0; m < hrtfdata->mysofa->M; m++) {

        // for (unsigned int n = 0; n < hrtfdata->mysofa->N; n++) {
        //     fftFile << "[" << m << "][" << n << "] Left: "  << std::fixed << std::setprecision(DEC_DIGIT) << hrtfdata->hrtf_left[m]->fdr(n) << " + "
        //                                                     << std::fixed << std::setprecision(DEC_DIGIT) << hrtfdata->hrtf_left[m]->fdi(n) << " j\n";
        // }
        // for (unsigned int n = 0; n < hrtfdata->mysofa->N; n++) {
        //     fftFile << "[" << m << "][" << n << "] Right: " << std::fixed << std::setprecision(DEC_DIGIT) << hrtfdata->hrtf_right[m]->fdr(n) << " + "
        //                                                     << std::fixed << std::setprecision(DEC_DIGIT) << hrtfdata->hrtf_right[m]->fdi(n) << " j\n";
        // }
        for (unsigned int n = 0; n < hrtfdata->hrtf_left[m]->get_length(); n++) {
            fftFile << "[" << m << "][" << n << "] Left: "  << hrtfdata->hrtf_left[m]->fdr(n) << " + "
                                                            << hrtfdata->hrtf_left[m]->fdi(n) << " j\n";
        }
        for (unsigned int n = 0; n < hrtfdata->hrtf_right[m]->get_length(); n++) {
            fftFile << "[" << m << "][" << n << "] Right: " << hrtfdata->hrtf_right[m]->fdr(n) << " + "
                                                            << hrtfdata->hrtf_right[m]->fdi(n) << " j\n";
        }
    }

    fftFile.close();
}