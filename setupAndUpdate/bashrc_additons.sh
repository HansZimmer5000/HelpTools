#!/bin/bash
# In use on Linux
# User specific aliases and functions
GRADLE_HOME=~/.gradle/

STARTCOLOR='\e[0;32m'
ENDCOLOR="\e[0m"
export PS1="<\u|\[$STARTCOLOR\]\W\[$ENDCOLOR\]> "

podmanreset(){
    read -p "This will kill all running containers, remove dangling images and prune the system!
(Enter to continue) "
    set -x
    podman rm -f $(podman ps -aq)
    podman system prune -f --volumes
    dangeling_images="$(podman images --filter dangling=true -q)"
    if ! [ -z "$dangeling_images" ]; then
        podman rmi -f $(podman images --filter dangling=true -q)
    fi
    set +x
}

podmanbashrun(){
    if [ -z "$1" ]; then
        echo "Need Image name!"
    else 
        podman run -it --rm "$1" bash
    fi
}

podmandeleteallimages(){
    while read line; do
        image=$(echo $line | awk '{print $3}')
        podman rmi -f $image
    done <<< $(podman images)
}

cleangradlecaches(){
    read -p "Removing local (.gradle) and home(~/.gradle/cache) folders, continue?"
    rm -r .gradle ~/.gradle/caches
}

# VirtualBox interaction
excel_vm=winVM
excel(){
    VBoxManage startvm "$excel_vm"
}

exceldown(){
    # acpipowerbutton = Needs to set "what do to when power button pressed" setting in Win10 to shutdown.
    VBoxManage controlvm "$excel_vm" savestate
}