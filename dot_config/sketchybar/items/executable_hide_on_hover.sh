#!/bin/bash

config=(
    drawing=off
    updates=on
    script="$PLUGIN_DIR/hide_on_hover.sh"
    label.drawing=off
    icon.drawing=off
)
sketchybar --add item hide_on_hover.controller left --set hide_on_hover.controller "${config[@]}"
sketchybar --subscribe hide_on_hover.controller mouse.entered.global mouse.exited.global
