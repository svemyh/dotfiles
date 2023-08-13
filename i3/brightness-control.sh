#!/bin/bash

output="eDP-1"  # Change this to your specific output name
current_brightness=$(xrandr --verbose | grep -m 1 -i brightness | awk '{print $2}')

increase_brightness() {
    new_brightness=$(echo $current_brightness + 0.1 | bc)
    if (( $(echo "$new_brightness > 1.0" | bc -l) )); then
        new_brightness=1.0
    fi
    xrandr --output $output --brightness $new_brightness
    current_brightness=$new_brightness
}

decrease_brightness() {
    new_brightness=$(echo $current_brightness - 0.1 | bc)
    if (( $(echo "$new_brightness < 0.1" | bc -l) )); then
        new_brightness=0.1
    fi
    xrandr --output $output --brightness $new_brightness
    current_brightness=$new_brightness
}

case "$1" in
    "increase")
        increase_brightness
        ;;
    "decrease")
        decrease_brightness
        ;;
esac

