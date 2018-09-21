# fix touchscreen: assign input to proper screen only
stylus_name=$(xinput list --name-only | grep "Wacom.*stylus")
eraser_name=$(xinput list --name-only | grep "Wacom.*eraser")
xinput --map-to-output $(xinput list --id-only "ELAN Touchscreen") eDP1
xinput --map-to-output $(xinput list --id-only "$stylus_name") eDP1
xinput --map-to-output $(xinput list --id-only "$eraser_name") eDP1

