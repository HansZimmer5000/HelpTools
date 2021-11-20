#!/bin/bash

# In use on MacOS
# User specific aliases and functionsexport BASH_SILENCE_DEPRECATION_WARNING=1

## env vars
alias docker=podman
alias clr="printf '\33c\e[3J'"
alias soffice=/Applications/LibreOffice.app/Contents/MacOS/soffice
export BASH_SILENCE_DEPRECATION_WARNING=1

## PS
STARTCOLOR='\e[0;32m'
ENDCOLOR="\e[0m"
export PS1="<\u|\[$STARTCOLOR\]\W\[$ENDCOLOR\]\\>\n"

## Container
container_cmd=docker # podman
containerreset(){
    read -p "This will kill all running containers, remove dangling images and prune the system!
(Enter to continue) "
    set -x
    $container_cmd rm -f $($container_cmd ps -aq)
    $container_cmd system prune -f --volumes
    dangeling_images="$($container_cmd images --filter dangling=true -q)"
    if [ -n "$dangeling_images" ]; then
        $container_cmd rmi -f $($container_cmd images --filter dangling=true -q)
    fi
    set +x
}

containerbashrun(){
    if [ -z "$1" ]; then
        echo "Need Image name!"
    else 
        $container_cmd run -it --rm --entrypoint bash "$1"
    fi
}

containerdeleteallimages(){
    images="$($container_cmd images)"
    line_no=1
    while read -r line; do
        if [ "$line_no" = 1 ]; then
            continue # Ignore first line
        else 
            image=$(echo "$line" | awk '{print $3}')
            $container_cmd rmi -f "$image"
        fi
    done <<< "$(echo $images)"
}
