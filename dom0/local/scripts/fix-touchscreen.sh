# fix touchscreen: assign input to proper screen only
xinput --map-to-output $(xinput list --id-only "ELAN Touchscreen") eDP1
xinput --map-to-output $(xinput list --id-only "Wacom ISDv4 EC Pen stylus") eDP1
xinput --map-to-output $(xinput list --id-only "Wacom ISDv4 EC Pen eraser") eDP1

