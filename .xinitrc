#!/bin/sh

# restore wallpaper
feh --bg-scale --no-fehbg $HOME/Media/Pictures/Wallpapers/freebsd-ascii-3840x2160.png &

# notifications
dunst &

# network applet
nm-applet &

# policy kit
/usr/libexec/polkit-gnome-authentication-agent-1 &

# dwm statusbar
$HOME/.scripts/dwm/statusbar.sh &

# launch dwm
exec dbus-launch --sh-syntax --exit-with-session dwm
