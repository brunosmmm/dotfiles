#!/usr/bin/env sh

## Add this to your wm startup file.
configfile=~/.config/polybar/config.ini
polybar=$(which polybar)
# polybar=~/work/polybar/build/bin/polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch multiple bars
for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ $monitor == "eDP1" ]; then
        MONITOR=$monitor $polybar -c $configfile main &
    else
        MONITOR=$monitor $polybar -c $configfile secondary &
    fi
done
