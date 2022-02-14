#!/bin/sh

# under/overclocking
sh $HOME/.scripts/mining/ethereum-oc.sh &

# restore wallpaper
feh --bg-scale --no-fehbg $HOME/Media/Pictures/Wallpapers/gruvbox-fedora-2560x1440.jpg &

# custom key mapping
xmodmap $HOME/.config/keymap &

# custom key rate
xset r rate 400 30 &

# polkit authentication
lxpolkit &

# unlock keyring
gnome-keyring-daemon --start &

# system tray applets
sh $HOME/.scripts/system/tray-applets.sh &

# dwm statusbar
sh $HOME/.scripts/dwm/statusbar.sh &

# start dwm
exec dbus-launch --exit-with-session dwm
