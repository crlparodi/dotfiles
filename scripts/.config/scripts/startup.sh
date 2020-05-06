#! /bin/bash
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

declare -A PID

PID[polybar]='-r top'
PID[dunst]=''
PID[conky]='-q'
PID[redshift-gtk]=''

for key in ${!PID[@]}; do
	killall -q $key

	while pgrep -u $UID -x $key > /dev/null;
	do 
		sleep 1
	done

	$key ${PID[$key]} &
done

# My personal todo management script

if pgrep -f "expeditor"; then
	pkill --signal SIGKILL -f "expeditor"
fi
~/Programs/expeditor/expeditor &

# Other apps that detect multi-instances
nm-applet &
nitrogen --restore &