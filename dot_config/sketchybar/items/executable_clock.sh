#!/bin/bash

config=(
    update_freq=10
    script="$PLUGIN_DIR/clock.sh"
    background.padding_left=$RADIUS
    background.padding_right=$RADIUS
)
sketchybar --add item clock right --set clock "${config[@]}"
