# determine tty based on OS
os=$(uname)
if [ "$os" = "FreeBSD" ]; then
  ostty="/dev/ttyv0"
elif [ "$os" = "Linux" ]; then
  ostty="/dev/tty1"
fi

# start windowing system
if [ -z $DISPLAY ] && [ "$(tty)" = "$ostty" ]; then
  if [ $XDG_SESSION_TYPE = "wayland" ]; then
    exec dwl -s "$HOME/.waylandrc"
  elif [ $XDG_SESSION_TYPE = "x11" ]; then
    exec startx -- -ardelay 400 -arinterval 30
  fi
fi
