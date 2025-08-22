#!/usr/bin/env python

import math
import os
import pickle
import subprocess
import sys

def get_measured():
    return int(subprocess.run(['xbacklight', '-get'], capture_output=True, text=True).stdout)

def get_perceived():
    with open(os.path.expanduser('~/.perceived_brightness'), 'rb') as fi:
        return pickle.load(fi)
        
def set_brightness(perceived):
    with open(os.path.expanduser('~/.perceived_brightness'), 'wb') as fi:
        pickle.dump(perceived, fi)
    subprocess.run(['xbacklight', '-set', str(perceived_to_measured(perceived))])

def perceived_to_measured(perceived):
    if perceived == 0: return 0
    else: return round(10**((perceived / 100) * 2 - 2) * 100)

def measured_to_perceived(measured):
    return round((math.log10(measured / 100) + 2) / 2 * 100)

if __name__ == '__main__':
    if not os.path.exists(os.path.expanduser('~/.perceived_brightness')):
        set_brightness(100)
    if (len(sys.argv) != 2):
        print("usage: brightness.py [-get] [-inc] [-dec]\nbrightness.py: error: one of the arguments -get -inc -dec is required")
    else:
        if (sys.argv[1] == "-inc" and get_perceived() < 100): set_brightness(get_perceived() + 5)
        elif (sys.argv[1] == "-dec" and get_perceived() > 0): set_brightness(get_perceived() - 5)
        elif (sys.argv[1] == "-get"): print(get_perceived())