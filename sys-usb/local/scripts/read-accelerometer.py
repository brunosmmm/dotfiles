#!/usr/bin/env python
from glob import glob
import sys
from os import path

def bdopen(fname):
    return open(path.join(basedir, fname))

def read_iio(fname):
    return bdopen(fname).read()

def read_accel(fp):
    fp.seek(0)
    return float(fp.read())*scale

for basedir in glob('/sys/bus/iio/devices/iio:device*'):
    if 'accel' in read_iio('name'):
        break
else:
    sys.stderr.write('Cannot find accelerometer\n')
    sys.exit(1)


scale = float(read_iio('in_accel_scale'))

accel_x = bdopen('in_accel_x_raw')
accel_y = bdopen('in_accel_y_raw')
x = read_accel(accel_x)
y = read_accel(accel_y)

print(x)
print(y)

