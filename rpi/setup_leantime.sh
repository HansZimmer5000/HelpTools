#!/bin/bash

set_dump_sql(){
    save_files=($(ls ../../mathesis/tickets/saves/))
    dump_file_index=$((${#save_files[@]}-1))
    dump_file=${save_files[dump_file_index]}

    read -p "This will delete the current db and import from dump.sql, is that what you want?"
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S rm -r /home/hape/dump.sql /home/hape/db_data/*"
    scp ../../mathesis/tickets/saves/$dump_file "$non_sudo_user"@"$server_url":/home/hape/dump.sql 1>/dev/null 2>&1
}

set_leantime_service(){
    service_name=leantime.service
    
    # podman run -it -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_DATABASE=leantime  -v $PWD/db21-01-01_19-34-03.sql:/docker-entrypoint-initdb.d/dump.sql -e MYSQL_USER=admin -e MYSQL_PASSWORD=pass mysql:5.7

    # Create Service file
    service="[Unit]
Description=Start Leantime
After=networking.service

[Service]
ExecStart=/usr/bin/bash -c '\
    /usr/bin/docker rm -f leantime;\
    /usr/bin/docker rm -f mysql_leantime;\
    /usr/bin/docker-compose -f /home/hape/docker-compose.yml up -d db;\
    sleep 30s ;\
    rm -f /home/hape/dump.sql ;\
    /usr/bin/docker-compose -f /home/hape/docker-compose.yml up -d web;\
    exit 0'


[Install]
WantedBy=multi-user.target"

    service="[Unit]
Description=Start Leantime
After=networking.service

[Service]
ExecStart=/usr/bin/bash -c '\
    /usr/bin/docker rm -f leantime ;\
    /usr/bin/docker rm -f mysql ;\
    sleep 5s ;\
    dump='' ;\
    /usr/bin/docker run -d -p 127.0.0.1:3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_DATABASE=leantime -e MYSQL_USER=admin -e MYSQL_PASSWORD=pass -v /home/hape/db_data:/var/lib/mysql -v /home/hape/dump.sql:/docker-entrypoint-initdb.d/dump.sql biarms/mysql:latest --character-set-server=utf8 --collation-server=utf8_unicode_ci;\
    sleep 45s ;\
    rm -f /home/hape/dump.sql ;\
    /usr/bin/docker run -d --net host -p 0.0.0.0:80:80 --name leantime -e LEAN_DB_DATABASE=leantime -e LEAN_DB_USER=admin -e LEAN_DB_PASSWORD=pass -e LEAN_DB_HOST=127.0.0.1 leantime:latest ;\
    exit 0'


[Install]
WantedBy=multi-user.target
"
    echo "$service" > tmp
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S rm /etc/systemd/system/$service_name /etc/systemd/system/multi-user.target.wants/$service_name /home/hape/docker-compose.yml" #1>/dev/null 2>&1 
    scp tmp "$non_sudo_user"@"$server_url":/home/hape/$service_name 1>/dev/null 2>&1
    scp leantime-compose.yaml "$non_sudo_user"@"$server_url":/home/hape/docker-compose.yml 1>/dev/null 2>&1

    # Move Service to server
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S mv /home/hape/$service_name /etc/systemd/system/$service_name" #1>/dev/null 2>&1 

    # Update systemd
    echo reload
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S systemctl daemon-reload" #1>/dev/null 2>&1 
    echo stop
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S systemctl stop $service_name" #1>/dev/null 2>&1 
    echo "enable"
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S systemctl enable $service_name" #1>/dev/null 2>&1 
    echo start
    ssh "$non_sudo_user"@"$server_url" "echo -n $SUDO_PW | sudo -S systemctl start $service_name" #1>/dev/null 2>&1 

    # Clean up
    rm tmp
}

non_sudo_user=hape
server_url=raspberrypinew
read -rsp "Input Sudo Pw: " SUDO_PW
echo

if [ "$1" = "dump" ]; then
    echo "Setting Dump"
    set_dump_sql
fi
set_leantime_service