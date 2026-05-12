#!/usr/bin/env bash
path="$HOME/Pictures/Screenshots/screenshot-$(date '+%Y-%m-%d_%H-%M-%S-%3N').png"
grim -o "$(hyprctl monitors | awk '/^Monitor/ {mon=$2} /focused: yes/ {print mon}')" $path
wl-copy < $path
