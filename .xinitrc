export PATH=/usr/local/texlive/2017/bin/x86_64-linux/:$PATH
xinput --map-to-output $(xinput list --id-only "ELAN Touchscreen") eDP-1
xinput --map-to-output $(xinput list --id-only "Wacom ISDv4 EC Pen stylus") eDP-1
xinput --map-to-output $(xinput list --id-only "Wacom ISDv4 EC Pen eraser") eDP-1 
export GTAGSLABEL=pygments
eval $(ssh-agent)
