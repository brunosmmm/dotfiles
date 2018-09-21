#!/usr/bin/env python

from time import sleep
from os import path as op
import sys
from subprocess import check_call, check_output
from glob import glob
from read_accelerometer import read_xy

devices = check_output(['xinput', '--list', '--name-only']).splitlines()

touchscreen_names = ['touchscreen', 'wacom']
touchscreens = [i for i in devices if any(j in i.lower() for j in touchscreen_names)]

disable_touchpads = False

touchpad_names = ['touchpad', 'trackpoint']
touchpads = [i for i in devices if any(j in i.lower() for j in touchpad_names)]

g = 7.0  # (m^2 / s) sensibility, gravity trigger

STATES = [
    {'rot': 'normal', 'coord': '1 0 0 0 1 0 0 0 1', 'touchpad': 'enable',
     'check': lambda x, y: y <= -g},
    {'rot': 'inverted', 'coord': '-1 0 1 0 -1 1 0 0 1', 'touchpad': 'disable',
     'check': lambda x, y: y >= g},
    {'rot': 'left', 'coord': '0 -1 1 1 0 0 0 0 1', 'touchpad': 'disable',
     'check': lambda x, y: x >= g},
    {'rot': 'right', 'coord': '0 1 0 -1 0 1 0 0 1', 'touchpad': 'disable',
     'check': lambda x, y: x <= -g},
]


def rotate(state):
    s = STATES[state]
    check_call(['xrandr', '--output', 'eDP1', '--rotate', s['rot']])
    for dev in touchscreens if disable_touchpads else (touchscreens + touchpads):
        check_call([
            'xinput', 'set-prop', dev,
            'Coordinate Transformation Matrix',
        ] + s['coord'].split())
    if disable_touchpads:
        for dev in touchpads:
            check_call(['xinput', s['touchpad'], dev])


def read_accel():
    x, y = read_xy()
    if x is None or y is None:
        # accelerometer not local
        x, y = check_output(['qvm-run', '-p', 'sys-usb', '/home/user/.local/scripts/read-accelerometer.py']).splitlines()
    return (float(x), float(y))



if __name__ == '__main__':

    current_state = None

    while True:
        x, y = read_accel()
        for i in range(4):
            if i == current_state:
                continue
            if STATES[i]['check'](x, y):
                current_state = i
                rotate(i)
                break
        sleep(1)
