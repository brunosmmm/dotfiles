#!/bin/bash
size=1280x720
pixfmt=yuyv422
echo "$size" "$pixfmt"
ffmpeg -f v4l2 -input_format "$pixfmt" -video_size "$size" -i /dev/video0 -codec copy -f rawvideo -
