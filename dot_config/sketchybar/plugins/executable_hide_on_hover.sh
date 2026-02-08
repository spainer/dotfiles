#!/bin/bash

case "$SENDER" in
    "mouse.entered.global")
        sketchybar --set clock drawing=off
        ;;
    "mouse.exited.global")
        sketchybar --set clock drawing=on
        ;;
esac