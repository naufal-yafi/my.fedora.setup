#!/bin/bash

if pgrep -x "wvkbd-mobintl" > /dev/null; then
    pkill wvkbd-mobintl
else
    ~/.config/scripts/wvkbd-mobintl -H 250 -L 250 &
fi