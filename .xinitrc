#!/bin/sh

# screen lock
xss-lock slock &

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

# Xresources
if [ -f "$XDG_CONFIG_HOME/Xresources" ]; then
    xrdb -merge "$XDG_CONFIG_HOME/Xresources"
fi

# launch dwm
if [ -n "${DBUS_SESSION_BUS_ADDRESS}" ]; then
    [ -d "/run/systemd/system" ] && flags=--systemd
    dbus-update-activation-environment ${flags} DISPLAY XAUTHORITY
    exec dwm
else
    exec dbus-launch --sh-syntax --exit-with-session dwm
fi
