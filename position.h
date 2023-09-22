#ifndef POSITION_H
#define POSITION_H

#include <cmath>
#include <libraries/math_neon/math_neon.h>

/** class to handle positioning & position conversions */
class Position
{
    public:
        float x;
        float y;
        float z;
        float radius;
		float azimuth;
		float elevation_angle;
        float deg2rad;

        Position();

        void s2c() {
            float cr = cosf(elevation_angle * deg2rad) * radius;
            x = cosf(azimuth * deg2rad) * cr;
            y = sinf(azimuth * deg2rad) * cr;
            z = sinf(elevation_angle * deg2rad) * radius;
        }
};

#endif