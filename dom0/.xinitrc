# setup touchscreen/stylus
stylus_name=$(xinput list --name-only | grep "Wacom.*stylus")
eraser_name=$(xinput list --name-only | grep "Wacom.*eraser")
xinput --map-to-output $(xinput list --id-only "ELAN Touchscreen") eDP1
xinput --map-to-output $(xinput list --id-only "$stylus_name") eDP1
xinput --map-to-output $(xinput list --id-only "$eraser_name") eDP1 

# try to enforce Qt theme settings
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
[ "$XDG_CURRENT_DESKTOP" = "i3" ] && export QT_QPA_PLATFORMTHEME="qt5ct"
