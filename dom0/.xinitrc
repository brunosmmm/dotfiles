# setup touchscreen/stylus
$HOME/.local/scripts/fix-touchscreen.sh

# try to enforce Qt theme settings
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
[ "$XDG_CURRENT_DESKTOP" = "i3" ] && export QT_QPA_PLATFORMTHEME="qt5ct"
