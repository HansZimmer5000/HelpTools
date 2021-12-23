#!/bin/bash

prepare_folder(){
    rm -f "$test_folder"/*
    mkdir -p "$test_folder"
}

create_csv(){
    for should_name in $should_names; do
        echo "$should_name${csv_delimiter}something0${csv_delimiter}something1${csv_delimiter}something2" >> "$test_folder/"names.csv
    done
}

create_images(){
    for is_name in $is_names; do
        touch "$test_folder/$is_name"
    done
}

test_images(){
    files="$(ls "$test_folder")"
    minimum_one_file_not_found=

    for should_name in $should_names; do
        should_file="$should_name$should_suffix"
        if [[ "$files" != *"$should_file"* ]]; then
            echo "Fail - Could not find file: $should_file"
            minimum_one_file_not_found=true
        fi
    done

    test -z "$minimum_one_file_not_found" && echo "Success"
}

is_names="1.png 2.png 3.png"
should_names="first second third"
should_suffix=".png"
csv_delimiter=","
test_folder="testfiles"

prepare_folder
create_csv
create_images

./script.sh testfiles

test_images
