#!/bin/bash

read -srp "Enter Server User Password: "
echo

get_temp(){
    remote_user=hape
    remote_server=raspberrypinew

    tmp=$(echo -n "$REPLY" | ssh "$remote_user"@"$remote_server" cat /sys/devices/virtual/thermal/thermal_zone0/temp)
    echo "Zone0: $((tmp/1000))°"
}

export -f get_temp
watch get_temp