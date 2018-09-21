#!/bin/bash

loopback_module=/home/user/.local/scripts/v4l2loopback.ko


# load module if not loaded
/usr/sbin/lsmod | grep v4l2loopback
if [ $? -ne 0 ]; then
  if [ ! -f $loopback_module ]; then
    echo "Loopback module not found"
    exit 1
  fi
  sudo modprobe videodev
  sudo insmod $loopback_module exclusive_caps=Y
fi
