#!/bin/bash

prepare_folder(){
    rm -rf "$test_folder"/*
    rm -f names.csv
    mkdir -p "$test_folder"
}

create_csv_v1(){
    for should_name in $should_names; do
        echo "$should_name${csv_delimiter}something0${csv_delimiter}something1${csv_delimiter}something2" >> names.csv
    done
}

create_csv_v2(){
    # TODO make dynamic
    echo "1.png${csv_delimiter}blatt1${csv_delimiter}first${csv_delimiter}description1${csv_delimiter}something1${csv_delimiter}8-4" >> names.csv
    echo "2.png${csv_delimiter}blatt2${csv_delimiter}second${csv_delimiter}description2${csv_delimiter}something2${csv_delimiter}8-3" >> names.csv
    echo "3.png & 4.png${csv_delimiter}blatt2${csv_delimiter}third${csv_delimiter}description3${csv_delimiter}something3${csv_delimiter}8-3" >> names.csv
}


create_images_v1(){
    for is_name in $is_names_v1; do
        touch "$test_folder/$is_name"
    done
}

create_images_v2(){
    for is_name in $is_names_v2; do
        touch "$test_folder/$is_name"
    done
}

test_images_v1(){
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

test_images_v2(){
    # TODO make dynamic
    files=("$test_folder"/8-4/first-1.png "$test_folder"/8-3/second-1.png "$test_folder"/8-3/third-1.png "$test_folder"/8-3/third-2.png)
    for file in "${files[@]}"; do
        if ! [ -f "$file" ]; then
            echo "Fail - Could not find file: $file"
            return
        fi
    done

    echo "Success"
}

is_names_v1="1.png 2.png 3.png"
is_names_v2="1.png 2.png 3.png 4.png"
should_filenames="$is_names_v2"
should_names="first second third"
should_suffix=".png"
csv_delimiter=","
test_folder="testfiles"

prepare_folder
create_csv_v1
create_images_v1
names_csv="$PWD"/names.csv ./script.sh testfiles v1
test_images_v1

prepare_folder
create_csv_v2
create_images_v2
names_csv="$PWD"/names.csv ./script.sh testfiles v2
test_images_v2



