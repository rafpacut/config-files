#!/bin/bash
#Rafal Pacut

#deklaracje
#granicy:
bound=1

#nazwy procesu:
process_name=`pidof opera`

#czestotliwosci sprawdzania:
time=10

while [ true ];
do

	#zebranie informacji o procesie
	data=`ps -p $process_name -o %cpu`

	#formatowanie informacji
	formated_data=`echo $data | cut -c 6-`
	int_formated_data=${formated_data/\.*}

	#warunek
	if [ $int_formated_data -ge $bound ]; then
		echo tak
	fi
	sleep "$time"m

done
