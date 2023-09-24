#!/bin/sh

# restore wallpaper
feh --bg-scale --no-fehbg $HOME/Media/Pictures/Wallpapers/freebsd-ascii-3840x2160.png &

# notifications
dunst &

# dwm statusbar
sh $HOME/.scripts/dwm/statusbar.sh &

# launch dwm
exec dbus-launch --sh-syntax --exit-with-session dwm
