#!/bin/sh

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
	i3 restart

;;

--desktop | -d)
	if xrandr --listmonitors | grep -q $LAPTOP > /dev/null ; then 
		xrandr --output $LAPTOP --off
	else
		echo $LAPTOP is already off. Pass.
	fi
	xrandr --output $DESKTOP --auto --dpi 92
	i3 restart
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
	i3 restart
;;

esac



