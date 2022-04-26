if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/ttyv0" ]; then
  #exec dwl -s "$HOME/.waylandrc"
  exec startx
fi
