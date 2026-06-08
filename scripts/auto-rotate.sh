#!/usr/bin/env bash

OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.active and .focused) | .name')

[ -z "$OUTPUT" ] && \
OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .name' | head -n1)

monitor-sensor | while read -r line; do
    case "$line" in
        *"orientation changed: normal"*)
            swaymsg output "$OUTPUT" transform normal
            ;;
        *"orientation changed: right-up"*)
            swaymsg output "$OUTPUT" transform 90
            ;;
        *"orientation changed: left-up"*)
            swaymsg output "$OUTPUT" transform 270
            ;;
        *"orientation changed: bottom-up"*)
            swaymsg output "$OUTPUT" transform 180
            ;;
    esac
done