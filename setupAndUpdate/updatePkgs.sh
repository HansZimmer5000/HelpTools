#!/bin/sh

log(){
    echo "$*" # add date if needed, e.g.: $(date +%m.%d.%Y) 
}

log_headline(){
    log "-- $*"
}

command_is_known(){
    cmd="$1"
    test -z "$cmd" && return 0
    which "$cmd" &> /dev/null
}

update_clean_package_manager(){
    need_sudo="$1"
    update_cmd="$2"
    clean_cmd="$3"
    sudo_cmd=""

    test "$need_sudo" = "true" && sudo_cmd="sudo"

    main_update_cmd=$(echo "$update_cmd" | cut -d' ' -f1)
    main_clean_cmd=$(echo "$clean_cmd" | cut -d' ' -f1)

    log_headline "$main_update_cmd"

    if command_is_known "$main_update_cmd"; then
        log "Starting Update"
        $sudo_cmd bash -c "$update_cmd"
    else
        log "Skipping Update (package manager unknown)"
    fi
    if command_is_known "$main_clean_cmd"; then
        log "Starting Cleaning"
        $sudo_cmd bash -c "$clean_cmd"
    else
        log "Skipping Cleaning (package manager unknown)"
    fi
}

country=Netherlands # or Germany, Greece, ...
orphan_options="-Qtd" # -q for package names without version
update_clean_package_manager "true" "pacman -Syyu" "paccache -r ; pacman-mirrors -c $country; echo 'Orphan packages'; pacman $orphan_options"

# If error like "libalpm.so.12: cannot open shared object file" occurs, fix via: 'git clone https://aur.archlinux.org/auracle-git.git; cd auracle-git; makepkg -si'
update_clean_package_manager "" "pacaur -Syyu" ""

update_clean_package_manager "true" "dnf update" "dnf autoremove -y ; dnf clean all"

update_clean_package_manager "true" "flatpak update" "apt-get upgrade ; apt-get autoremove"

update_clean_package_manager "true" "apt-get update" "apt-get upgrade ; apt-get autoremove"

update_clean_package_manager "" "brew update" "brew upgrade"
