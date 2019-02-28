#!/usr/bin/env python
from glob import glob
import sys
from os import path

def bdopen(basedir, fname):
    return open(path.join(basedir, fname))

def read_iio(basedir, fname):
    return bdopen(basedir, fname).read()

def read_accel(scale, fp):
    fp.seek(0)
    return float(fp.read())*scale

def read_xy():
    for basedir in glob('/sys/bus/iio/devices/iio:device*'):
        if 'accel' in read_iio(basedir, 'name'):
            break
    else:
        return (None, None)

    scale = float(read_iio(basedir, 'in_accel_scale'))

    accel_x = bdopen(basedir, 'in_accel_x_raw')
    accel_y = bdopen(basedir, 'in_accel_y_raw')
    x = read_accel(scale, accel_x)
    y = read_accel(scale, accel_y)
    return (x, y)

if __name__ == "__main__":
    x, y = read_xy()
    if x is None or y is None:
        print('Accelerometer not found')
        exit(1)
    print(x)
    print(y)

