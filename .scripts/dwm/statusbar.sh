#!/bin/sh

# Statusbar loop
while true; do
  xsetroot -name "$(sysctl dev.cpu.0.temperature | awk '{print $NF}')  $(apm -l)%  $(date +" %A, %b %d %H:%M ")"
	sleep 1
done
