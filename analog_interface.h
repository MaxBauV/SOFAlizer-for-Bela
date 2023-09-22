#ifndef ANALOG_INTERFACE_H
#define ANALOG_INTERFACE_H

#include <Bela.h>

#define SMOOTHED_PROPORTION 0
#define MEASURED_PROPORTION 1

class Potentiometer {
    public:
        /** Converted value */
        float currentValue;
        float smoothedValue;

        Potentiometer();
        Potentiometer(float oldRangeMin, float oldRangeMax);
        ~Potentiometer();
        void convertCurrentValue(float currentRawValue);
        void setOldRange(float minimum, float maximum) { oldMin = minimum; oldMax = maximum; };
        void setNewRange(float minimum, float maximum) { newMin = minimum; newMax = maximum; };

    private:
        float oldMin, oldMax;
        float newMin, newMax;

};


class AnalogInterface {
    public:
        Potentiometer leftAzimuthPot;
        Potentiometer leftElevationPot;
        Potentiometer rightAzimuthPot;
        Potentiometer rightElevationPot;

        bool incButtonValueCurr;
        bool incButtonValuePrev;
        bool decButtonValueCurr;
        bool decButtonValuePrev;
        bool bypassButtonValueCurr;
        bool bypassButtonValuePrev;

        AnalogInterface();
        ~AnalogInterface();
        void read(BelaContext *context, int frame);

};


#endif