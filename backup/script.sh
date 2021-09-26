#!/bin/bash

sub_folder="Aufräumen"

src="/run/media/hape/Michis BackUP/$sub_folder/" # Trailing Slash important
trg="/run/media/hape/Seagate/$sub_folder"

rsync -av --dry-run --delete "$src" "$trg" &>rsync-dry.log
