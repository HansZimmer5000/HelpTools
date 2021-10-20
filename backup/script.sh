#!/bin/bash

sub_folder="Aufräumen"

disk1="/run/media/hape/Michis BackUP"
disk2="/run/media/hape/MichisBackUp1"

src="$disk1/$sub_folder/" # Trailing Slash important
trg="$disk2/$sub_folder"

rsync -av --dry-run --delete "$src" "$trg" &>rsync-dry.log

read -p "Continue without dry-run? (y/n): " -n 1
if [ "$REPLY" = "y" ]; then
    rsync -av --delete "$src" "$trg" &>rsync.log
fi
