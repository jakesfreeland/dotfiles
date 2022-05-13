#!/bin/sh

# Statusbar loop
while true; do
	xsetroot -name "$(date +" %A, %b %d %H:%M ")"
	sleep 1
done
