#!/bin/bash

#Define locale
if [[ ! -z  $LOCALE ]]
then
	if [ "$LOCALE" != "en_US" ]
	then
		locale-gen $LOCALE
	fi
	
	export LANG=$LOCALE
	export LANGUAGE=$LOCALE
	export LC_ALL=$LOCALE
fi

#Define standard password
if [[ -z  $VNC_PASS ]]
then
	export VNC_PASS=gnucash
fi

#Startup
export DISPLAY=:1
export NOVNC=/opt/noVNC
Xvfb :1 -screen 0 1920x1080x24+32 &
sleep 5
openbox-session&
# x11vnc -display :1 -nopw -listen localhost -passwd $VNC_PASS -xkb -ncache 10 -ncache_cr -forever &
x11vnc -display :1 -nopw -listen localhost -passwd $VNC_PASS -xkb -ncache 0 -forever &
ln -s $NOVNC/vnc.html $NOVNC/index.html && $NOVNC/utils/launch.sh --vnc localhost:5900 &
gnucash $FILE
