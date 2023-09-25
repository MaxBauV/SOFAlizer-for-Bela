//#include <mutex>

#include "osc.h"
#include "settings.h"
#include "global_variables.h"

OSCinterface::OSCinterface() {
    localPort = LOCAL_PORT;
    remotePort = REMOTE_PORT;
    remoteIP = REMOTE_IP;
}

void OSCinterface::send_filename (char* filename) {
    oscSender.newMessage("/filenames/").add(std::string (filename)).send();
}

void OSCinterface::send_hrtf_num (unsigned int hrtf_num) {
    oscSender.newMessage("/hrtf_num/").add(std::to_string(hrtf_num)).send();
}

void OSCinterface::send_status (std::string status) {
    oscSender.newMessage("/status/").add(status).send();
}

void OSCinterface::get_angle_pos0 (void) {
    #if MUTEX
        m_left_pos.lock();
    #endif
    oscSender.newMessage("/position/0").add(leftPosition.azimuth).add(leftPosition.elevation_angle).send();
    #if MUTEX
        m_left_pos.unlock();
    #endif
}

void OSCinterface::get_angle_pos1 (void) {
    #if MUTEX
        m_right_pos.lock();
    #endif
    oscSender.newMessage("/position/1").add(righPosition.azimuth).add(righPosition.elevation_angle).send();
    #if MUTEX
        m_right_pos.unlock();
    #endif
}

void osc_on_receive(oscpkt::Message* msg, const char* addr, void* arg)
{
    if(msg) {
        if(msg->match("/system/filtering")) {
            bool b;
            msg->arg().popBool(b).isOkNoMoreArgs();
            bypass = b;
        }
        else if(msg->match("/position/set/angle/0")){
            float a;
            float e;
            msg->arg().popFloat(a).popFloat(e).isOkNoMoreArgs();
            #if MUTEX
                m_left_pos.lock();
            #endif
            leftPosition.azimuth = fmod(a, 360);
            leftPosition.elevation_angle = fmod(e, 360);
            #if MUTEX
                m_left_pos.unlock();
            #endif
            rt_printf("fmod(%f, 360) = %f\n", a, fmod(a, 360));
            rt_printf("received a %f\n", leftPosition.azimuth);
            rt_printf("received e %f\n", leftPosition.elevation_angle);
        }
        else if(msg->match("/position/set/angle/1")){
            float a;
            float e;
            msg->arg().popFloat(a).popFloat(e).isOkNoMoreArgs();
            #if MUTEX
                m_right_pos.lock();
            #endif
            righPosition.azimuth = fmod(a, 360);
            righPosition.elevation_angle = fmod(e, 360);
            #if MUTEX
                m_right_pos.unlock();
            #endif
            rt_printf("received a %f\n", righPosition.azimuth);
            rt_printf("received e %f\n", righPosition.elevation_angle);
        }
        else if(msg->match("/position/set/norm/0")){
            float left_x;
            float left_y;
            msg->arg().popFloat(left_x).popFloat(left_y).isOkNoMoreArgs();
            #if MUTEX
                m_left_pos.lock();
            #endif
            /** Convert from range 0...1 to range RANGE_MIN_AZI...RANGE_MAX_AZI */
            leftPosition.azimuth = (((left_x - 0) * (RANGE_MAX_AZI - RANGE_MIN_AZI)) / (1 - 0)) + RANGE_MIN_AZI;
            /** Convert from range 0...1 to range RANGE_MIN_ELE...RANGE_MAX_ELE */
            leftPosition.elevation_angle = (((left_y - 0) * (RANGE_MAX_ELE - (RANGE_MIN_ELE))) / (1 - 0)) + (RANGE_MIN_ELE);
            #if MUTEX
                m_left_pos.unlock();
            #endif
        }
        else if(msg->match("/position/set/norm/1")){
            float right_x;
            float right_y;
            msg->arg().popFloat(right_x).popFloat(right_y).isOkNoMoreArgs();
            #if MUTEX
                m_right_pos.lock();
            #endif
            /** Convert from range 0...1 to range RANGE_MIN_AZI...RANGE_MAX_AZI */
            righPosition.azimuth = (((right_x - 0) * (RANGE_MAX_AZI - RANGE_MIN_AZI)) / (1 - 0)) + RANGE_MIN_AZI;
            /** Convert from range 0...1 to range RANGE_MIN_ELE...RANGE_MAX_ELE */
            righPosition.elevation_angle = (((right_y - 0) * (RANGE_MAX_ELE - (RANGE_MIN_ELE))) / (1 - 0)) + (RANGE_MIN_ELE);
            #if MUTEX
                m_right_pos.unlock();
            #endif
        }
        else if(msg->match("/position/get/angle/0")) {
            send_pos_0 = true;
        }
        else if(msg->match("/position/get/angle/1")) {
            send_pos_1 = true;
        }
        else if(msg->match("/hrtf/select")) {
            int num;
            msg->arg().popInt32(num).isOkNoMoreArgs();
            #if MUTEX
                m_hrtf_num.lock();
            #endif
            if (num <= hrtf_num) {
                hrtf_num = num;
            }
            else {
                hrtf_num = hrtf_cnt-1;
            }
            #if MUTEX
                m_hrtf_num.unlock();
            #endif
            rt_printf("hrtf_num %d, hrtf_cnt %d\n", hrtf_num, hrtf_cnt);
        }
        else if(msg->match("/hrtf/inc")) {
            #if MUTEX
                m_hrtf_num.lock();
            #endif
            hrtf_num++;
            if (hrtf_num == hrtf_cnt) {
                hrtf_num = 0;
            }
            #if MUTEX
                m_hrtf_num.unlock();
            #endif
        }
        else if(msg->match("/hrtf/dec")) {
            #if MUTEX
                m_hrtf_num.lock();
            #endif
            hrtf_num--;
            if (hrtf_num == -1) {
                hrtf_num = hrtf_cnt-1;
            }
            #if MUTEX
                m_hrtf_num.unlock();
            #endif
        }
    }
}

