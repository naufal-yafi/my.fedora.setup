#!/bin/bash

if pgrep -x "wvkbd-mobintl" > /dev/null; then
    echo "󰌌 "
else
    echo " "
fi