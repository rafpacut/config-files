#!/bin/bash

function change 
{
	number=`echo $1 | cut -c7- | cut -c-1`
	echo $number
	newname=minute0$number.png
	echo $newname
	mv $1 $newname
}
for i in *
do
	case $i in
	minute[0-9].png) change $i;;
	esac
done
