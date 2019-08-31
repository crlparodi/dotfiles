#!/bin/sh

# CONTROL_FILE='/tmp/volume-control.nid'

# if [ -e $CONTROL_FILE ]; then
#	NID=`cat $CONTROL_FILE`
# else
#	NID=`notify-send "Volume" -t 500`
#	echo $NID > $CONTROL_FILE
# fi

case $1 in
	"up")
		amixer -q sset Master,0 2%+ unmute
		;;
	"down")
		amixer -q sset Master,0 2%- unmute
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

if [[ $muted == "off" ]]; then
	dunstify "Volume" -i audio-volume-muted-blocking -r 2593 -u normal "$muted"
else
	dunstify "Volume" -i audio-volume-muted-blocking -r 2593 -u normal "$volume%"
fi

echo $NID > $CONTROL_FILE

