#!/bin/bash

path=~/dane/Pictures/golden_gate/
while [ true ] 
do
	if [ `date +%S` -eq 00 ] 
	then
		while [ true ]
		do

			weekday=`date +%u`
			day=`date +%e`
			hour=`date +%I`
			daytime=`date +%p`
			minute=`date +%M`



				composite $path/weekday$weekday.png $path/day$day.png $path/output
				composite $path/output $path/hour$hour.png $path/output
				composite $path/output $path/$daytime.png $path/output
				composite $path/output $path/minute$minute.png $path/output
				composite $path/output $path/bg.jpg $path/output
				
				fbsetbg -F $path/output

				sleep 1m
		done
	fi
done
