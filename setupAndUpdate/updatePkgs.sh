#!/bin/sh
set -e #Exit on error

if [[ "$(lsb_release -a )" == *"Manjaro"* ]]; then
    echo "--"
    echo "--"
    echo "Updating Pacman!"
    echo "--"
    echo "--"
    sudo pacman -Syyu

    echo "--"
    echo "--"
    echo "Updating PacAur!"
    echo "--"
    echo "--"
    pacaur -Syyu

    echo "--"
    echo "--"
    echo "Cleaning up Pacman Cache!"
    echo "--"
    echo "--"
    sudo paccache -r

    echo "--"
    echo "--"
    echo "Listing orphan package!"
    echo "--"
    echo "--"
    # -q for package names without version
    sudo pacman -Qtd

    echo "--"
    echo "--"
    echo "Updating Flatpak!"
    echo "--"
    echo "--"
    flatpak update


    sudo pacman-mirrors -c Netherlands # or Germany, Greece, ...
elif [[ "$(lsb_release -a )" == *"Fedora"* ]]; then
    echo "--"
    echo "--"
    echo "Updating DNF!"
    sudo dnf update 
    echo "--"
    echo "--"

    echo "--"
    echo "--"
    echo "Cleaning up DNF!"
    sudo dnf autoremove -y
    echo "--"
    echo "--"
fi

