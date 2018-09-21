#!/bin/bash

/usr/sbin/lsmod | grep v4l2loopback
if [ $? -ne 0 ]; then
  sudo modprobe videodev
  sudo insmod /home/user/.local/scripts/v4l2loopback.ko exclusive_caps=Y
fi
