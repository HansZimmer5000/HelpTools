#!/bin/sh
set -e #Exit on error

update_pacman(){
    echo "--"
    echo "--"
    echo "Updating Pacman!"
    sudo pacman -Syyu
}

update_pacaur(){
    echo "--"
    echo "--"
    echo "Updating PacAur!"
    pacaur -Syyu
}

update_dnf(){
    echo "--"
    echo "--"
    echo "Updating DNF!"
    sudo dnf update 
}

update_flatpak(){
    echo "--"
    echo "--"
    echo "Updating Flatpak!"
    flatpak update
}

update_apt(){
    echo "--"
    echo "--"
    echo "Updating Apt!"
    sudo apt update ; sudo apt upgrade
}

clean_dnf(){
    echo "--"
    echo "--"
    echo "Cleaning up DNF!"
    sudo dnf autoremove -y
    sudo dnf clean all
}

clean_pacman(){
    echo "--"
    echo "--"
    echo "Cleaning up Pacman Cache!"
    sudo paccache -r
}

clean_apt(){
    echo "--"
    echo "--"
    echo "Cleaning up Pacman Cache!"
    sudo apt autoremove
}

if [[ "$(lsb_release -a )" == *"Manjaro"* ]]; then
    update_pacman
    update_pacaur
    update_flatpak

    clean_pacman
    echo "--"
    echo "--"
    echo "Listing orphan package!"
    # -q for package names without version
    sudo pacman -Qtd
    sudo pacman-mirrors -c Netherlands # or Germany, Greece, ...
elif [[ "$(lsb_release -a )" == *"Fedora"* ]]; then
    update_dnf
    update_flatpak
    clean_dnf
    # TODO update and clean up snapcraft
    # TODO clean up flatpak not possible?
elif [[ "$(lsb_release -a )" == *"Raspbian"* ]]; then
    update_apt
    clean_apt
fi

