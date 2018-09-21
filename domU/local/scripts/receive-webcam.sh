#!/bin/bash
read size pixfmt
# setup loopback
/home/user/.local/scripts/setup-v4l2.sh
if [ $? -ne 0 ]; then
  echo "Error setting up V4L2 loopback"
  exit 1
fi
ffmpeg -s "$size" -f rawvideo -pix_fmt "$pixfmt" -i - -f v4l2 /dev/video0

/home/user/.local/scripts/deinit-v4l2.sh
