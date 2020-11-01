#!/bin/bash


set_x_variables(){
    export XSOCK=/tmp/.X11-unix
    #export XAUTH=/tmp/.docker.xauth
    #xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
    #export XAUTH
}

#podman run -ti -e DISPLAY --rm -v 
# --net=host localhost/xclockimage
#        -e XAUTHORITY=$XAUTH \
#        -v $XAUTH:$XAUTH \
start_x_container(){
    set_x_variables
    podman run \
        --rm \
        -it \
        -e DISPLAY \
        -v $XSOCK:$XSOCK \
        -v /home/hape/repositories/sharedToWinVm:/shared \
        --net=host \
        -v /run/user/1000/gdm/Xauthority:/root/.Xauthority:Z \
        wine-arch:test #docker.io/library/archlinux:20200908
}

#pacman -Syyu 
#pacman -S vim
#https://wiki.archlinux.org/index.php/Official_repositories#multilib
#pacman -S wine

set_x_variables
start_x_container 

#podman run -it -d --rm \
#    archlinux:20200908
#    bash

# in Container (preperation for Build file)
#pacman -Syyu
#pacman -S wine winetricks


# Alternative:
#podman run -it -d --rm \
#    tianon/wine:5.10 
#    bash

# in that container
#apt-get update