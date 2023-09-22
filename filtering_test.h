#ifndef FILTERING_TEST_H
#define FILTERING_TEST_H

#include <vector>

#include "bela_sofa.h"
#include "circular_buffer.h"

void filtering_multiple_positions_cpu(std::vector<HRTFData>& hrtfdata, const CircBuff *incBuff, uint32_t inPtr, CircBuff *outcBuff, uint32_t outPtr);
void filtering_multiple_positions_neon(std::vector<HRTFData>& hrtfdata, const CircBuff *incBuff, uint32_t inPtr, CircBuff *outcBuff, uint32_t outPtr);


#endif