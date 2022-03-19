#!/bin/sh

if pgrep spotifyd > /dev/null; then
  spt
else
  spotifyd && spt
fi

