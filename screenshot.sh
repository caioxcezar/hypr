#!/usr/bin/env bash
path="$HOME/Pictures/Screenshots/screenshot-$(date '+%Y-%m-%d_%H-%M-%S-%3N').png"
grim -g "$(slurp)" $path
wl-copy < $path
