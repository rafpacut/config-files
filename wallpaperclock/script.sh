#!/bin/bash

path=~/dane/Pictures/wallpaper_clocks/golden_gate/
while [ true ] 
do

	weekday=`date +%u`
	day=`date +%e`
	hour=`date +%I`
	daytime=`date +%p`
	minute=`date +%M`
	month=`date +%m`



		composite $path/weekday$weekday.png $path/day$day.png $path/output
		composite $path/output $path/month$month.png $path/output
		composite $path/output $path/hour$hour.png $path/output
		composite $path/output $path/$daytime.png $path/output
		composite $path/output $path/minute$minute.png $path/output
		composite $path/output $path/bg.jpg $path/output
		
		fbsetbg -F $path/output

		while [ `date +%S` -ne 00 ]
		do
			sleep 1s
		done
done
