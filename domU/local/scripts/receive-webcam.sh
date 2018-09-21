#!/bin/bash
read size pixfmt
/home/user/.local/scripts/setup-v4l2.sh
ffmpeg -s "$size" -f rawvideo -pix_fmt "$pixfmt" -i - -f v4l2 /dev/video0

/home/user/.local/scripts/deinit-v4l2.sh
