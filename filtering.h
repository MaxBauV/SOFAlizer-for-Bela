#ifndef FILTERING_H
#define FILTERING_H

#include <vector>

#include "bela_sofa.h"
#include "circular_buffer.h"

void filtering(std::vector<HRTFData>& hrtfdata, const CircBuff *incBuff, uint32_t inPtr, CircBuff *outcBuff, uint32_t outPtr);

#endif