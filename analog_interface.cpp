#include "analog_interface.h"
#include "settings.h"

/**
 * Constructor for Potentiometer class
 */
Potentiometer::Potentiometer() {
    smoothedValue = 0;
}

/**
 * Deconstructor for Potentiometer class
 */
Potentiometer::~Potentiometer() {

}

/**
 * Converts Value range
 */
void Potentiometer::convertCurrentValue(float currentRawValue) {
    currentValue = (((currentRawValue - oldMin) * (newMax - newMin)) / (oldMax - oldMin)) + newMin;
}

/**
 * Constructor for AnalogInterface class
 */
AnalogInterface::AnalogInterface()  {

    /** Set conversion ranges of analog interface */
    leftAzimuthPot.setOldRange(0, 1);
    leftAzimuthPot.setNewRange(RANGE_MIN_AZI, RANGE_MAX_AZI);

    leftElevationPot.setOldRange(0, 1);
    leftElevationPot.setNewRange(RANGE_MIN_ELE, RANGE_MAX_ELE);

    rightAzimuthPot.setOldRange(0, 1);
    rightAzimuthPot.setNewRange(RANGE_MIN_AZI, RANGE_MAX_AZI);

    rightElevationPot.setOldRange(0, 1);
    rightElevationPot.setNewRange(RANGE_MIN_ELE, RANGE_MAX_ELE);

    incButtonValuePrev = true;
    decButtonValuePrev = true;
    bypassButtonValuePrev = true;


}

/**
 * Deconstructor for AnalogInterface class
 */
AnalogInterface::~AnalogInterface() {

}

/**
 * Reads values from 4 potentiometers, smooths fluctuations
 */
void AnalogInterface::read(BelaContext *context, int frame) {
    /** Reading and smoothing Potentiometer values */
    leftAzimuthPot.smoothedValue    = SMOOTHED_PROPORTION * leftAzimuthPot.smoothedValue    + MEASURED_PROPORTION * analogRead(context, frame, POT_LEFT_AZI);
    leftElevationPot.smoothedValue  = SMOOTHED_PROPORTION * leftElevationPot.smoothedValue  + MEASURED_PROPORTION * analogRead(context, frame, POT_LEFT_ELE);
    rightAzimuthPot.smoothedValue   = SMOOTHED_PROPORTION * rightAzimuthPot.smoothedValue   + MEASURED_PROPORTION * analogRead(context, frame, POT_RIGHT_AZI);
    rightElevationPot.smoothedValue = SMOOTHED_PROPORTION * rightElevationPot.smoothedValue + MEASURED_PROPORTION * analogRead(context, frame, POT_RIGHT_ELE);

    /** Convert range */
    leftAzimuthPot.convertCurrentValue(leftAzimuthPot.smoothedValue);
    leftElevationPot.convertCurrentValue(leftElevationPot.smoothedValue);
    rightAzimuthPot.convertCurrentValue(rightAzimuthPot.smoothedValue);
    rightElevationPot.convertCurrentValue(rightElevationPot.smoothedValue);
}