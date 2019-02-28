#!/bin/bash

# Deactivate touchscreen when wacom pen is in proximity
# Activate touchscreen when wacom pen gets out

sleeptime="0.3s"
lastPenPosition="Proximity=Out"
stylus_name=$(xinput list --name-only | awk 'match($0, /Wacom/){ print $0; exit; }')
touchscreen_name=$(xinput list --name-only | grep "ELAN.*")
while true
do 
    mssg="`xinput query-state "$stylus_name" | grep Proximity`"
    if [ ${#mssg} -gt 1 ]
    then
        inout="`echo $mssg | awk '{print $3}'`"
        case "$inout" in
            "Proximity=In" )
                if [ $lastPenPosition != $inout ]
                then
                    xinput --disable "$touchscreen_name"
                    lastPenPosition=$inout
                fi
                ;;
            "Proximity=Out" )
                if [ $lastPenPosition != $inout ]
                then
                    xinput --enable "$touchscreen_name"
                    lastPenPosition=$inout
                fi
                ;;
        esac
    fi
    sleep $sleeptime
done

