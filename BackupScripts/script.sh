#!/bin/bash

sub_folder="Aufräumen"

src="/run/media/hape/Michis BackUP/$sub_folder/" # Trailing Slash important
trg="/run/media/hape/Seagate Expansion Drive/$sub_folder"

rsync -av --delete "$src" "$trg"
