#ifndef CIRCULAR_BUFFER_H
#define CIRCULAR_BUFFER_H

#include <vector>

/** class for circular buffer */
class CircBuff
{
    public:
        /** TD data of analog audio inputs */
        std::vector<float> left;
        std::vector<float> right;
};

#endif