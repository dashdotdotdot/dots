#!/usr/bin/env bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME label.color=0xffFB5D7C
else
    sketchybar --set $NAME label.color=0x77e24567
fi
