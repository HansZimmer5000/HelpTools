#!/bin/bash

set_leantime_service(){
    non_sudo_user=hape
    server_url=raspberrypinew
    service_name=leantime.service
    
    # Create Service file
    service="[Unit]
Description=Start Leantime
After=networking.service

[Service]
ExecStart=/usr/bin/docker-compose -f /home/hape/docker-leantime/docker-compose.yml up

[Install]
WantedBy=multi-user.target"
    echo "$service" > tmp
    scp tmp "$non_sudo_user"@"$server_url":/home/hape/leantime.service 1>/dev/null 2>&1

    # Move Service to server
    read -rsp "Input Sudo Pw: "
    echo
    ssh "$non_sudo_user"@"$server_url" "echo -n $REPLY | sudo mv /home/hape/$service_name /etc/systemd/system/$service_name" 1>/dev/null 2>&1 

    # Update systemd
    ssh "$non_sudo_user"@"$server_url" "echo -n $REPLY | sudo -S systemctl stop $service_name" 1>/dev/null 2>&1 
    ssh "$non_sudo_user"@"$server_url" "echo -n $REPLY | sudo -S systemctl daemon-reload" 1>/dev/null 2>&1 
    ssh "$non_sudo_user"@"$server_url" "echo -n $REPLY | sudo -S systemctl enable $service_name" 1>/dev/null 2>&1 
    ssh "$non_sudo_user"@"$server_url" "echo -n $REPLY | sudo -S systemctl start $service_name" 1>/dev/null 2>&1 

    # Clean up
    rm tmp
}

set_leantime_service