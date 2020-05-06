#!/bin/bash
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

case $1 in
	"up")
		amixer -q sset Master,0 2%+ unmute
		;;
	"down")
		amixer -q sset Master,0 2%- unmute
		;;
	"UP")
		amixer -q sset Master,0 10%+ unmute
		;;
	"DOWN")
		amixer -q sset Master,0 10%- unmute
		;;
	"toggle")
		amixer set Master toggle
		;;
	"help")
		echo "Usage: $0 [command] [arguments...]"
		echo ""
		echo "Commands:"
		echo -e "\tup\t:\tincrease the volume"
		echo -e "\tdown\t:\tdecrease the volume"
		echo -e "\ttoggle\t:\ttoggle the volume on or off"
		echo -e "\thelp\t:\tthis help menu"
		exit
		;;
	*)
		echo "I don't know what you mean"
		exit 1
		;;
esac

muted=`amixer -M get Master | tail -n1 | sed -E 's/.*\[([a-z]+)\]/\1/'`
volume=`amixer -M get Master | tail -n1 | sed -E 's/.*\[([0-9]+)\%\].*/\1/'`
bar=$(seq -s "─" $(($volume / 5)) | sed 's/[0-9]//g')

if [[ "$muted" == "off" ]] 
then
	dunstify "Volume" -i audio-volume-muted-blocking -r 2593 -u normal "$muted"
else
	dunstify "Volume" -i audio-volume-muted-blocking -r 2593 -u normal "$volume%"
fi

# echo $NID > $CONTROL_FILE

