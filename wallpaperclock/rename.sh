#!/bin/bash

function change_minutes
{
	number=`echo $1 | cut -c7- | cut -c-1`
	newname=minute0$number.png
	mv $1 $newname
}
function change_hours
{
	number=`echo $1 | cut -c5- | cut -c-1`
	newname=hour0$number.png
	mv $1 $newname
}

function change_months
{
	number=`echo $1 | cut -c6- | cut -c-1`
	newname=month0$number.png
	mv $1 $newname
}

function change_days
{
	number=`echo $1 | cut -c4- | cut -c-1`
	newname=day0$number.png
	mv $1 $newname
}

for i in *
do

	case $i in
		month[0-9].png) change_months $i;;
		minute[0-9].png) change_minutes $i;;
		hour[0-9].png) change_hours $i;;
		day[0-9].png) change_days $i;;
		am.png) mv am.png AM.png;;
		pm.png) mv pm.png PM.png
	esac
done
