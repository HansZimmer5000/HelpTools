#!/bin/sh

set_x_variables(){
    export XSOCK=/tmp/.X11-unix
    export XAUTH=/tmp/.docker.xauth
    xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
    export XAUTH
}

start_x_container(){
    set_x_variables
    docker run \
        --rm \
        -it \
        -v $(pwd)/eclipse:/eclipse/ \
        -v $(pwd)/repo:/repo/ \
        -e XAUTHORITY=$XAUTH \
        -e DISPLAY \
        -v $XSOCK:$XSOCK \
        -v $XAUTH:$XAUTH \
        --name browser \
        $image $1
}

start_bash(){
    start_x_container "bash"
}

build_image(){
    docker build . -t $image
}

print_help() { 
    echo "
This scripts interacts with the containerized Floodlight repo and Eclipse IDE. Before starting the docker container, this script will always build a new image with the local Dockerfile.
If no option is given the IDE is started.
Options:

Container Execution (-c, -i, -e cannot be combined, the last given will be used!):
-e  Execute Bash inside the container

Misc:
-s  Skip the building of the image.
-h  Prints this help.
"
}

#-------------
# Script begin

image="chromium:v0.1" 
execute=start_bash
build=true

if [ "$#" -eq "0" ]; then
    print_help
else 
    while getopts "seh" arg; do
        case "${arg}" in
            s)  
                build=false
                ;;
            e) 
                execute=start_bash
                ;;
            *|h)
                print_help
                exit 1 # So the following code is not executed
                ;;
        esac
    done

    if $build; then
        echo "-- Building Image"
        build_image > /dev/null
    else
        echo "-- Skipping Image Build"
    fi

    echo "-- Starting Container"
    $execute
fi
