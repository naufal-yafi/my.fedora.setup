#!/usr/bin/env bash

get_output() {
    swaymsg -t get_outputs | jq -r '
        .[] | select(.active and .focused) | .name
    ' | head -n1
}

OUTPUT=$(get_output)

[ -z "$OUTPUT" ] && \
OUTPUT=$(swaymsg -t get_outputs | jq -r '
    .[] | select(.active) | .name
' | head -n1)

rotate() {
    local transform="$1"

    # rotate display
    swaymsg output "$OUTPUT" transform "$transform"

    # remap pointer/touch ke output yg sudah diputar
    swaymsg input type:touch map_to_output "$OUTPUT"
    swaymsg input type:pointer map_to_output "$OUTPUT"
}

monitor-sensor | while read -r line; do
    case "$line" in
        *"orientation changed: normal"*)
            rotate normal
            ;;
        *"orientation changed: right-up"*)
            rotate 90
            ;;
        *"orientation changed: left-up"*)
            rotate 270
            ;;
        *"orientation changed: bottom-up"*)
            rotate 180
            ;;
    esac
done