#!/bin/bash

# sysbench --test=cpu --cpu-max-prime=10000 --num-threads=4 run
# vcgencmd measure_temp 
# cat /proc/loadavg
# watch $(( $(cat /sys/devices/virtual/thermal/thermal_zone0/temp) / 100))"°"

set_service_file(){
    echo "$2" > tmp
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S rm /etc/systemd/system/$1" 1>/dev/null 2>&1
    scp tmp "$non_sudo_user"@"$server_url":/home/hape/"$1" 1>/dev/null 2>&1
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S mv /home/hape/$1 /etc/systemd/system/$1" 1>/dev/null 2>&1
}

set_service_systemd(){
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S systemctl daemon-reload" 1>/dev/null 2>&1
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S systemctl enable $1" 1>/dev/null 2>&1
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S systemctl stop $1" 1>/dev/null 2>&1
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S systemctl start $1" 1>/dev/null 2>&1
}

set_service_cleanup(){
    rm tmp
}

# $1 = service name
# $2 = service code
set_systemd_unit(){
    if [ -z "$1" ]; then
        echo "Param 1 not given!"
    elif [ -z "$2" ]; then
        echo "Param 2 not given!"
    else
        echo "Setting Unit: $1"
        set_service_file "$1" "$2"
        set_service_systemd "$1"
        set_service_cleanup
    fi
}

set_dump_sql(){
    save_files=($(ls ../../mathesis/tickets/saves/))
    dump_file_index=$((${#save_files[@]}-1))
    dump_file=${save_files[dump_file_index]}

    read -rp "This will delete the current db and import from dump.sql, is that what you want?"
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S rm -fr /home/hape/dump.sql /home/hape/db_data/*"
    scp ../../mathesis/tickets/saves/"$dump_file" "$non_sudo_user"@"$server_url":/home/hape/dump.sql 1>/dev/null 2>&1
}

set_leantime_service(){
    service_name=leantime.service
    service="$(cat services/leantime.service)"
    set_systemd_unit $service_name "$service"
}

set_backup_service(){  
    service_name=leantime-backup.service
    service="$(cat services/leantime-backup.service)"
    set_systemd_unit $service_name "$service"

    service_name=leantime-backup.timer
    service="$(cat services/leantime-backup.timer)"
    set_systemd_unit $service_name "$service"
}

non_sudo_user=hape
server_url=raspberrypinew
read -rsp "Input Server User Password: " SUDO_PW
echo

if [ "$1" = "dump" ]; then
    echo "Setting Dump"
    set_dump_sql
fi
set_leantime_service
set_backup_service