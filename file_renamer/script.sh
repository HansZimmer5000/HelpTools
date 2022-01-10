#!/bin/bash

check_filename_v2(){
    filename="$1"
    file_age="$2"

    if [[ "$filename" == *"O."*"Nr."* ]]; then 
        echo "Skipping $file_age FileName $filename due to name 'O. Nr.'"
    elif [[ "$filename" == *"TODO"* ]]; then 
        echo "Skipping $file_age FileName $filename due to place 'TODO'"
    elif [[ "$filename" == *"?"* ]]; then 
        echo "Skipping $file_age FileName $filename due to '?' in Inv.Nr. or Description"
    elif [[ "$filename" == *"/"* ]]; then 
        echo "Skipping $file_age FileName $filename due to '/' in Inv.Nr. or Description"
    fi
}

prepare_environment_v1(){
    if ! [ -f "$names_csv" ]; then
        echo "Cannot find $names_csv"
        exit 1
    fi

    # TODO weird code line to have if names_csv is somewhere else (and so the names_csv has a path included)
    files_to_rename=($(ls $folder | sed "s|$names_csv||g"))
    new_file_names=

    while IFS="$csv_delimiter" read -r name rest; do
        new_file_names=(${new_file_names[@]} "$name")
    done < "$names_csv"

    file_count="${#files_to_rename[@]}"
    name_count="${#new_file_names[@]}"
    if [ "$file_count" != "$name_count" ]; then
        echo "Length is not equal: file count ($file_count), name count ($name_count)"
        echo "$folder $PWD"
        exit 1
    fi
}

rename_files_v1(){
    for ((i=0; i<"$name_count"; i++)); do
        file=${files_to_rename[$i]}
        name=${new_file_names[$i]}
        file_ending=$(echo "$file" | rev | cut -d"." -f1 | rev)
        
        test "$folder/$file" = "$folder/$name.$file_ending" && echo "Already renamed" || mv "$folder/$file" "$folder/$name.$file_ending"
    done
}

rename_files_v2(){
    unset new_file_names

    row_count=1
    while read -r ; do
        if [ "$row_count" -eq 1 ]; then
            row_count=$((row_count+1))
            continue
        fi
    
        filenames=$(echo "$REPLY" | cut -d"$csv_delimiter" -f1)
        invno=$(echo "$REPLY" | cut -d"$csv_delimiter" -f3)
        description=$(echo "$REPLY" | cut -d"$csv_delimiter" -f4)
        place=$(echo "$REPLY" | cut -d"$csv_delimiter" -f6)

        if [ -z "$filenames" ]; then
            echo "Skipping, no filename(s)"
        fi

        unset new_file_name_basis
        if [ -n "$invno" ]; then
            new_file_name_basis="$invno"
        elif [ -n "$description" ]; then
            new_file_name_basis="$description" # TODO maybe replace " " with "_"
        else
            echo "Skipping: $filenames do not have Inv.Nr. or Description"
            row_count=$((row_count+1))
            continue
        fi

        filename_no=1
        file_suffix="JPG"
        for filename in $filenames; do
            test "$filename" = "&" && continue
            filename_check_result=$(check_filename_v2 "$filename" "Old")
            if [ -n "$filename_check_result" ]; then
                echo "$filename_check_result"
                continue
            fi
            
            new_file_name="$new_file_name_basis-$filename_no.$file_suffix"
            filename_check_result=$(check_filename_v2 "$new_file_name" "New")
            if [ -n "$filename_check_result" ]; then
                echo "$filename_check_result"
                continue
            fi

            mkdir -p "$folder/$place"
            echo "Moving $folder/$filename.$file_suffix to $folder/$place/$new_file_name"
            mv "$folder/$filename.$file_suffix" "$folder/$place/$new_file_name"
            filename_no=$((filename_no+1))
        done
        row_count=$((row_count+1))

        # TODO
        # Iterate through file name
        # rename each to "<name (Inv. No or Description)>-<no>.<old file suffix>"
    done < "$names_csv"
}

parse_input(){
    test -n "$1" && folder="$1"
    folder=${folder%/}

    version=1
    if [ "$1" = "v2" ] || [ "$2" = "v2" ]; then
        version=2
    fi

    echo "Variables:
    algorithm_version=$version
    csv_delimiter=$csv_delimiter
    folder=$folder
    names_csv=$names_csv"

    test -n "$force" && return 
    read -rp "Variables above correct? (y/n) "
    test "$REPLY" = "y" || exit 1
}

csv_delimiter=${csv_delimiter:-","}
folder=${1:-Bilder}
names_csv=${names_csv:-"~/Dropbox/Mueller-Mombartz/RPM-Bilder/BilderNamen.csv"}
force=${force:-""}

parse_input "$@"

case "$version" in
    1) 
        prepare_environment_v1
        rename_files_v1
        ;;
    2) 
        rename_files_v2
        ;;
esac

