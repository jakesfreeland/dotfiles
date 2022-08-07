#!/bin/sh

# determine OS
os=$(uname)
if [ "$os" = "FreeBSD" ]; then
  while true; do
    xsetroot -name "$(sysctl dev.cpu.0.temperature | awk '{print $NF}')  $(apm -l)%  $(date +" %A, %b %d %H:%M:%S ")"
    sleep 1
  done
elif [ "$os" = "Linux" ]; then
  while true; do
    xsetroot -name "$(date +" %A, %b %d %H:%M:%S ")"
    sleep 1
  done
fi

