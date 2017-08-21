#!/bin/bash
export DISPLAY=:1
export NOVNC=/opt/noVNC
Xvfb :1 -screen 0 1440x900x16 &
sleep 5
openbox-session&
x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
ln -s $NOVNC/vnc.html $NOVNC/index.html && $NOVNC/utils/launch.sh --vnc localhost:5900 &
gnucash
