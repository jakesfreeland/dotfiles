#!/bin/sh

if pgrep -x "spotifyd" > /dev/null; then
  spt
else
  spotifyd && spt
fi

