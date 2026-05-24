#!/usr/bin/env bash
path="$HOME/Pictures/Screenshots/screenshot-$(date '+%Y-%m-%d_%H-%M-%S-%3N').png"
grim -o "$(hyprctl monitors | awk '/^Monitor/ {mon=$2} /focused: yes/ {print mon}')" $path
if [[ $? -eq 0 ]]; then
    mpv --no-video  "$HOME/.config/hypr/sound-screenshot.mp3"
    wl-copy < $path
fi
