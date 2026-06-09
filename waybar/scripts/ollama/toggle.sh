#!/bin/bash

if pgrep -x ollama > /dev/null; then
    pkill -x ollama
    notify-send "Ollama" "󱆽 OFF"
else
    ollama serve > /dev/null 2>&1 &
    notify-send "Ollama" "󰜪 ON"
fi