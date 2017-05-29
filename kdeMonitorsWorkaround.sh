#!/bin/bash
xrandr -q | grep "\bDP1 connected\b"

if [ $? -eq 0 ]; then
	xrandr --output DP1 --pos 0x0 --mode 1920x1080 --refresh 59.9502
	xrandr --output eDP1 --off
	xrandr --noprimary
fi

xrandr -q | grep "\bVGA1 connected\b" 

if [ $? -eq 0 ]; then
	xrandr --output VGA1 --auto
	xrandr --output eDP1 --off
	xrandr --noprimary
fi
