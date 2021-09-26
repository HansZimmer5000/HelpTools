#!/bin/bash

target_folder="~/Schreibtisch"
resolution="1280x720"
fps=25

for elem in $(ls *.MOV); do 
    ffmpeg -i $elem -s $resolution -r $fps "$target_folder/$elem.mp4"
done