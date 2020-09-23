#!/bin/bash


podman run -it --rm \
    -v ~/Schreibtisch/office2016/Iso:/office2016:z \
    "test"
    bash

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