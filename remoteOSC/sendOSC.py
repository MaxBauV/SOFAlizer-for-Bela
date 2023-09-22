#!/usr/bin/env python3

import argparse
from pythonosc.udp_client import SimpleUDPClient
import re

def parse_args():
    parser = argparse.ArgumentParser()
    parser = argparse.ArgumentParser(description="send any OSC message to given IP & port")
    parser.add_argument("-p", "--port", metavar="port", type=int, default=7562, help="the port to send to, default: 7562")
    parser.add_argument("-ip", metavar="ip", type=str, default="192.168.0.33", help="the ip to send to, default: 192.168.0.32")
    args = parser.parse_args()
    return args

def main():
    args = parse_args()
    client = SimpleUDPClient(args.ip, args.port)

    while True:
        inp = input(">")

        if (inp == 'q'):
            break
        elif (inp == "s1"):
            client.send_message("/position/set/angle/0", [90.0, 25.5])
        elif (inp == "s2"):
            client.send_message("/position/set/angle/1", [95.0, 10.0])
        elif (inp == "n1"):
            client.send_message("/position/set/norm/0", [0.5, 1])
        elif (inp == "n2"):
            client.send_message("/position/set/norm/1", [0.25, 0.1])
        elif (inp == "g1"):
            client.send_message("/position/get/angle/0", 1)
        elif (inp == "g2"):
            client.send_message("/position/get/angle/1", 1)
        elif (inp == "b0"):
            client.send_message("/system/filtering", False)
        elif (inp == "b1"):
            client.send_message("/system/filtering", True)
        elif (inp == "hrtf"):
            client.send_message("/hrtf/select", 23)
        elif (inp == '+'):
            client.send_message("/hrtf/dec", 1)
        elif (inp == '-'):
            client.send_message("/hrtf/inc", 1)

if __name__ == '__main__':
    main()