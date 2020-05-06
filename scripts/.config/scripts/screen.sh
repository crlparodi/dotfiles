#!/bin/sh
#
# Y88b           .d8888b. Y88b   d88P 8888888b.          
#  Y88b         d88P  Y88b Y88b d88P  888   Y88b         
#   Y88b        888    888  Y88o88P   888    888         
#    Y88b       888          Y888P    888   d88P         
#    d88P       888           888     8888888P"          
#   d88P        888    888    888     888                
#  d88P         Y88b  d88P    888     888                
# d88P           "Y8888P"     888     888       88888888 
#
# Author: Cyril PARODI   
# https://github.com/crlparodi/dotfiles  

LAPTOP='eDP-1'
DESKTOP='HDMI-2'
DISPATCH='right-of'

case $1 in
--laptop | -l)
	if xrandr --listmonitors | grep -q $DESKTOP ; then 
		xrandr --output $DESKTOP --off
		else
		echo $DESKTOP is already off. Pass.
	fi
	xrandr --output $LAPTOP --auto --dpi 112
	bspwm wm -r restart

;;

--desktop | -d)
	if xrandr --listmonitors | grep -q $LAPTOP > /dev/null ; then 
		xrandr --output $LAPTOP --off
	else
		echo $LAPTOP is already off. Pass.
	fi
	xrandr --output $DESKTOP --auto --dpi 92
	bspwm wm -r
;;

--full | -f)
	if [ ! `xrandr --listmonitors | grep -q $DESKTOP` ] ; then 
		xrandr --output $DESKTOP --auto
		else
		echo $DESKTOP is already activated. Pass.
	fi
	if [ ! `xrandr --listmonitors | grep -q $LAPTOP` ] ; then 
		xrandr --output $LAPTOP --auto
		else
		echo $LAPTOP is already activated. Pass.
	fi
	xrandr --output $DESKTOP --auto --dpi 92 --$DISPATCH $LAPTOP --auto --dpi 112
	bspwm wm -r
;;

esac



