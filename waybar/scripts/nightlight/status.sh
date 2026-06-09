#!/bin/bash

if pgrep -x gammastep > /dev/null; then
    echo "󰖔 ON"
else
    echo "󰖕 OFF"
fi