#!/bin/bash
USER="rafal"
USERID=`id -u $USER`

sudo -u $USER /bin/bash -c "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$USERID/bus notify-send -t 5000 -u normal 'relax eyes (20-20-20)'"
