#!/usr/bin/env python3

import argparse
from pythonosc.dispatcher import Dispatcher
from pythonosc.osc_server import BlockingOSCUDPServer


def osc_handler(address, *args):
    print(f"{address}: {args}")

def parse_args():
    parser = argparse.ArgumentParser()
    parser = argparse.ArgumentParser(description="receive any OSC message on given port")
    parser.add_argument("-p", "--port", metavar="port", type=int, default=7563, help="the port to listen on, default: 7563")
    args = parser.parse_args()
    return args

def main():
    args = parse_args()
    dispatcher = Dispatcher()
    dispatcher.set_default_handler(osc_handler)

    ip = ""
    server = BlockingOSCUDPServer((ip, args.port), dispatcher)
    server.serve_forever()  # Blocks forever

if __name__ == '__main__':
    main()