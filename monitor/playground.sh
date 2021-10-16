#!/bin/bash

list_monitors_and_possible_modes(){
    xrandr -q 
}   

set_mode(){
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Missing Input 1 (Screen) and/or Output 2 (Resolution)"
        return 1
    fi

    read -n 1 -p "Setting $1 to $2, ok? (y/n)" -r
    echo
    if [ "$REPLY" = "y" ]; then
        xrandr --verbose --output "$1" --mode "$2"
    fi
}

set_mode eDP-1 1600x900

# TODO Setup 2nd Screen
# xrandr --auto --output <theoutputname> --mode <theresolution> --right-of <otheroutputname>.
# add '--primary' to make referenced output primary Screen
# turn off laptop eDP-1 