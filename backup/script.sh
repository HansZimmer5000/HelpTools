#!/bin/bash

sub_folder="Aufräumen" #"Aufräumen" #"Unpersönliche Media"

disk1="/run/media/hanszimmer/MichisBackUp1"
disk2="/run/media/hanszimmer/MichisBackUp2"

src="$disk1" # Trailing Slash important
trg="$disk2"
if [ -n "$sub_folder" ]; then
    src="$src/$sub_folder"
    trg="$trg/$sub_folder"
fi
src="$src/" # Trailing Slash important

read -p "Synching $src to $trg, correct? (y/n) "
if [ "$REPLY" != "y" ]; then
    exit 1
fi
echo

rsync -av --dry-run --delete "$src" "$trg" &>rsync-dry.log

echo "Dry run done, now check for errors / if everything look alright."
read -p "Continue without dry-run? (y/n): "
if [ "$REPLY" = "y" ]; then
    rsync -av --delete "$src" "$trg" &>rsync.log
fi
