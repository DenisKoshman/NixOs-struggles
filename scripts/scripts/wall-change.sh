#!/usr/bin/env bash

animations=("outer" "center" "any" "wipe")
random_animation=${animations[RANDOM % ${#animations[@]}]}

# Adjust these variables to find your "sweet spot"
DURATION=0.5
FPS=100
STEP=200

if [[ "$random_animation" == "wipe" ]]; then
    swww img "$1" \
        --transition-type="wipe" \
        --transition-angle=135 \
        --transition-duration=$DURATION \
        --transition-fps=$FPS \
        --transition-step=$STEP &
else
    swww img "$1" \
        --transition-type="$random_animation" \
        --transition-duration=$DURATION \
        --transition-fps=$FPS \
        --transition-step=$STEP &
fi
