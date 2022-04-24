if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  #exec dwl -s "$HOME/.waylandrc"
  exec startx
fi
