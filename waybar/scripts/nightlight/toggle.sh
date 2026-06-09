#!/bin/bash

if pgrep -x gammastep > /dev/null; then
    pkill gammastep
    notify-send "󰖕 Night Light OFF" "Gammastep turn off"
else
    gammastep -O 4500 &
    notify-send "󰖔 Night Light ON" "Color temperature: 4500K"
fi