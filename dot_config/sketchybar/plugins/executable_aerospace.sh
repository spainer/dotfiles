#!/bin/bash

export COLOR=0x40ffffff
export BORDER_COLOR=0x30ffffff
export BORDER_WIDTH=2
export HEIGHT=20
export RADIUS=10

PREVIOUS=($(sketchybar --query bar | jq -r '.items[] | select(test("^ws\\."))'))

CURRENT=()
for monitor in $(aerospace list-monitors --format "%{monitor-id}"); do
    WORKSPACES=($(aerospace list-workspaces --monitor "$monitor"))
    for ws in ${WORKSPACES[@]}; do
        ws_id="ws.$monitor.$ws"
        CURRENT+=("$ws_id")

        if [[ ! "${PREVIOUS[*]}" =~ "$ws_id" ]]; then
            config=(
                display="$monitor"
                label="$ws"
                label.padding_left=10
                label.padding_right=10
                background.color=$COLOR
                background.height=$HEIGHT
                background.corner_radius=$RADIUS
                background.border_width=$BORDER_WIDTH
                background.border_color=$BORDER_COLOR
            )
            sketchybar --add item "$ws_id" left --set "$ws_id" "${config[@]}"
        fi

        if [[ "$ws" == "${FOCUSED:-1}" ]]; then
            config=(
                background.drawing=on
            )
            sketchybar --set "$ws_id" "${config[@]}"
        else
            config=(
                background.drawing=off
            )
            sketchybar --set "$ws_id" "${config[@]}"
        fi
    done
done

for ws_id in ${PREVIOUS[@]}; do
    if [[ ! "${CURRENT[*]}" =~ "$ws_id" ]]; then
        sketchybar --remove "$ws_id"
    fi
done

sketchybar --reorder "${CURRENT[@]}"
