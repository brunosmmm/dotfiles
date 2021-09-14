#!/bin/bash
xrandr --output DP-0 --off --output DP-1 --mode 1920x1080 --pos 0x0 --rotate normal --scale 1.7778x1.7778 --output HDMI-0 --primary --mode 3840x2160 --pos 3412x0 --rotate normal --scale 1x1
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'Gdk/WindowScalingFactor', <2>}]"

