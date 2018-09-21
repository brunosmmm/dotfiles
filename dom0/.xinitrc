# setup touchscreen/stylus
xinput --map-to-output $(xinput list --id-only "ELAN Touchscreen") eDP1
xinput --map-to-output $(xinput list --id-only "sys-usb: Wacom ISDv4 EC Pen stylus") eDP1
xinput --map-to-output $(xinput list --id-only "sys-usb: Wacom ISDv4 EC Pen eraser") eDP1 

# try to enforce Qt theme settings
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
[ "$XDG_CURRENT_DESKTOP" = "i3" ] && export QT_QPA_PLATFORMTHEME="qt5ct"
