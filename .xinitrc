#!/bin/sh

# under/overclocking
# sh $HOME/.scripts/mining/ethereum-oc.sh &

# restore wallpaper
feh --bg-scale --no-fehbg $HOME/Media/Pictures/Wallpapers/gruvbox-fedora-2560x1440.jpg &

# custom key mapping
xmodmap $XDG_CONFIG_HOME/keymap &

# custom key rate
xset r rate 400 30 &

# polkit authentication
lxpolkit &

# unlock keyring
gnome-keyring-daemon --start &

# notifications
dunst &

# system tray applets
pasystray &
nm-applet &

# dwm statusbar
sh $HOME/.scripts/dwm/statusbar.sh &

# launch dwm
exec dbus-launch --sh-syntax --exit-with-session dwm
