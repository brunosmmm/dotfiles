# fix touchscreen: assign input to proper screen only
stylus_name=$(xinput list --name-only | grep "Wacom.*stylus")
eraser_name=$(xinput list --name-only | grep "Wacom.*eraser")
touchscreen_name=$(xinput list --name-only | grep "ELAN.*")
xinput --map-to-output $(xinput list --id-only "$touchscreen_name") eDP1
xinput --map-to-output $(xinput list --id-only "$stylus_name") eDP1
xinput --map-to-output $(xinput list --id-only "$eraser_name") eDP1

