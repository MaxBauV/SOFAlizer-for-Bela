#ifndef OSC_H
#define OSC_H

#include <libraries/OscSender/OscSender.h>
#include <libraries/OscReceiver/OscReceiver.h>

class OSCinterface {
    public:
        OscReceiver oscReceiver;
        OscSender oscSender;
        int localPort;
        int remotePort;
        const char* remoteIP;
        //Pipe oscPipe;
        OSCinterface();
        // void setup();
        void send_filename(char* filename);
        void send_hrtf_num(unsigned int hrtf_num);
        void send_status(std::string status);
        void get_angle_pos0(void);
        void get_angle_pos1(void);
};

void osc_on_receive(oscpkt::Message* msg, const char* addr, void* arg);

#endif