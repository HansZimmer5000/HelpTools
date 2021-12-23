#!/bin/bash

prepare_environment(){
    if ! [ -f "$folder/names.csv" ]; then
        echo "Cannot find names.csv in folder: $folder"
        exit 1
    fi

    files_to_rename=($(ls $folder | sed 's|names.csv||g'))
    new_file_names=

    while IFS="$csv_delimiter" read -r name rest; do
        new_file_names=(${new_file_names[@]} "$name")
    done < "$folder/names.csv"

    file_count="${#files_to_rename[@]}"
    name_count="${#new_file_names[@]}"
    if [ "$file_count" != "$name_count" ]; then
        echo "Length is not equal: file count ($file_count), name count ($name_count)"
        exit 1
    fi
}

rename_files(){
    for ((i=0; i<"$name_count"; i++)); do
        file=${files_to_rename[$i]}
        name=${new_file_names[$i]}
        file_ending=$(echo "$file" | rev | cut -d"." -f1 | rev)
        
        test "$folder/$file" = "$folder/$name.$file_ending" && echo "Already renamed" || mv "$folder/$file" "$folder/$name.$file_ending"
    done
}

parse_input(){
    test -n "$1" && folder="$1"
}

csv_delimiter=","
folder="$PWD"

parse_input "$@"
prepare_environment
rename_files
