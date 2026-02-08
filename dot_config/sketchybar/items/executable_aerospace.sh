#!/bin/bash

config=(
    drawing=off
    updates=on
    script="$PLUGIN_DIR/aerospace.sh"
    label.drawing=off
    icon.drawing=off
)
sketchybar --add item aerospace.controller left --set aerospace.controller "${config[@]}"

sketchybar --add event aerospace_workspace_changed
sketchybar --subscribe aerospace.controller aerospace_workspace_changed
