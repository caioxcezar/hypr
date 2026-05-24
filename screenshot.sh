#!/usr/bin/env bash
path="$HOME/Pictures/Screenshots/screenshot-$(date '+%Y-%m-%d_%H-%M-%S-%3N').png"
grim -g "$(slurp)" $path
if [[ $? -eq 0 ]]; then
    mpv --no-video  "$HOME/.config/hypr/sound-screenshot.mp3"
    wl-copy < $path
fi
