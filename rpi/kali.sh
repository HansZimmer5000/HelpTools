#!/bin/bash

# Based upon https://www.kali.org/docs/arm/kali-linux-raspberry-pi/ For Pre Build Versions

set_disk_location(){
    # TODO or find via: sudo fdisk -l?

    file=abc.md
    read -p "Place '$file' in your sd card to be used "
    found_locations=$(sudo find / -type f -name $file 2>/dev/null | grep $file)
    if [[ "$found_locations" != *"$file"* ]]; then
        echo File not found!
        exit 1
    fi

    if [ $(echo "$found_locations" | wc -l) -gt 1 ]; then
        echo Multiple locations found: $found_locations, clean them up so only one exists!
        exit 1
    fi

    found_location=$(echo "$found_locations" | sed "s|/$file||g")
    mount=$(cat /proc/mounts | grep $found_location | awk '{print $1}')
    if [ -z "$mount" ]; then
        echo "Could not find suitable mount for $found_location"
        exit 1
    fi
    disk_location=$mount
}
disk_location=""
image="/home/hape/Schreibtisch/kali-linux-2020.4-rpi4-nexmon-64.img.xz"

set_disk_location

read -p "Using 

   image: $image
location: $disk_location

Continue (Abort with Str+C)? "

if [[ "$image" == *".xz" ]]; then
    sudo xz -cd "$image" | sudo dd of="$disk_location" bs=4M iflag=fullblock oflag=direct status=progress
else
    sudo dd if="$image" of="$disk_location" bs=4M iflag=fullblock oflag=direct status=progress
fi
