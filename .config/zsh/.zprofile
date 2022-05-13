# determine tty based on OS
os=$(uname)
if [ "$os" = "FreeBSD" ]; then
  ostty="/dev/ttyv0"
elif [ "$os" = "Linux" ]; then
  ostty="/dev/tty1"
fi

# start declared windowing system
if [ -z $DISPLAY ] && [ "$(tty)" = "$ostty" ]; then
  if [ $DISPSERV = "wayland" ]; then
    exec dwl -s "$HOME/.waylandrc"
  elif [ $DISPSERV = "x" ]; then
    exec startx
  fi
fi
