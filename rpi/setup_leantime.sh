#!/bin/bash

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
set_service(){
    if [ -z "$1" ]; then
        echo "Param 1 not given!"
    elif [ -z "$2" ]; then
        echo "Param 2 not given!"
    else
        echo "Setting Service: $1"
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
    service="[Unit]
Description=Start Leantime
After=networking.service

[Service]
ExecStart=/usr/bin/bash -c '\
    /usr/bin/docker rm -f leantime; \
    /usr/bin/docker rm -f mysql; \
    sleep 5s; \
    dump=''; \
    /usr/bin/docker run -d -p 127.0.0.1:3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_DATABASE=leantime -e MYSQL_USER=admin -e MYSQL_PASSWORD=pass -v /home/hape/db_data:/var/lib/mysql -v /home/hape/dump.sql:/docker-entrypoint-initdb.d/dump.sql biarms/mysql:latest --character-set-server=utf8 --collation-server=utf8_unicode_ci;\
    sleep 45s; \
    rm -f /home/hape/dump.sql; \
    /usr/bin/docker run -d --net host -p 0.0.0.0:80:80 --name leantime -e LEAN_DB_DATABASE=leantime -e LEAN_DB_USER=admin -e LEAN_DB_PASSWORD=pass -e LEAN_DB_HOST=127.0.0.1 leantime:latest; \
    exit 0'

[Install]
WantedBy=multi-user.target
"
    set_service $service_name "$service"
}

set_backup_service(){  
    service_name=leantime-backup.service
    service="[Unit]
Description=Backup Leantime
After=networking.service
After=leantime.service

[Service]
ExecStart=bash -c '\
    rm -rf /home/hape/backup2.sql; \
    test -f /home/hape/backup.sql && mv /home/hape/backup.sql /home/hape/backup2.sql; \
    /usr/bin/docker exec -u root mysql mysqldump -u root --password=pass leantime 1> /home/hape/backup.sql'

[Install]
WantedBy=multi-user.target
"
    set_service $service_name "$service"

    service_name=leantime-backup.timer
    service="[Unit]
Description=Backup Leantime every 10 minutes
After=networking.service
After=leantime.service

[Timer]
OnCalendar=*:0/10

[Install]
WantedBy=timers.target
"
    set_service $service_name "$service"
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