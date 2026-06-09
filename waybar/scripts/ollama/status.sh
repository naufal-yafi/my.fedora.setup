#!/bin/bash

if pgrep -x ollama > /dev/null; then
    echo "󰜪 ON"
else
    echo "󱆽 OFF"
fi