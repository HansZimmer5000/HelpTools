#!/bin/sh

delete_all_orphan_packages(){
    sudo pacman -R $(sudo pacman -Qtdq)
}

package_was_deleted_before(){
    if [[ "$deleted_orphan_packages" == *"$1"* ]]; then
        echo true
    else
        echo false
    fi
}

deleted_orphan_packages=$(cat deleted_orphan_packages.txt)

if [[ "$(lsb_release -a )" == *"Manjaro"* ]]; then
    echo "$deleted_orphan_packages"

    echo "--"
    echo "--"
    echo "Removing Orphan Packages!"
    
    orphan_packages=""
    while IFS= read -r line; do
        # Or set "package_was_deleted_before" - if to here
        IFS=' ' read name version <<< $line
        orphan_packages="$orphan_packages $name=$version"
    done <<< $(sudo pacman -Qtd)

    orphan_packages_to_delete=""
    for package in $orphan_packages; do   
        read -p "Delete '$package'? (y/n) " answer
        if [ "$answer" == "y" ]; then
            IFS='=' read name version <<< $package
            orphan_packages_to_delete="$orphan_packages_to_delete $name"

            # Or set "package_was_deleted_before" - if to here
            if "$(package_was_deleted_before "$package")"; then
                :
            else
                echo "$package" >> deleted_orphan_packages.txt
            fi
        fi
    done

    sudo pacman -R $orphan_packages_to_delete
fi