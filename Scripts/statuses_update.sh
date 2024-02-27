#!/bin/bash
while true
do
	DAT=`date +"%T"`
	BAT=$(acpi | cut -d, -f2 | cut -d" " -f2 | cut -d% -f1 | awk '{s+=$1} END {print s}')
	VOL=`amixer sget Master | grep Mono: | cut -d"[" -f2 | cut -d"]" -f1 | cut -d% -f1`
	CPU=`top -b -n 1 | grep %Cpu | awk '{print $2}'`
	MEM=$(echo "scale=2;`top -b -n 1 | grep cache | awk '{print $8}'` / `top -b -n 1 | grep cache | awk '{print $4}'`" | bc | cut -d. -f2)
	xsetroot -name "󰍛 $MEM% | 󰍛 $CPU% | 󰕾 $VOL |  $BAT | $DAT"
	# echo "󰍛 $MEM% | 󰍛 $CPU% | 󰕾 $VOL |  $BAT | $DAT"
	sleep 1  

done
