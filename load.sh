#!/bin/bash

get_bash_major_version(){
    full_version=$(bash --version | head -n 1 | cut -d' ' -f 4)
    major_version=$(echo "$full_version" | cut -d'.' -f 1)
    echo "$major_version"
}

set_escape_character_variable(){
    escape_character='\e'
    major_version=$(get_bash_major_version)
    if [ "$major_version" -lt 4 ]; then
        escape_character='\x1B' #https://superuser.com/questions/33914/why-doesnt-echo-support-e-escape-when-using-the-e-argument-in-macosx#comment814922_33991
    fi
}

load_symbols(){
    echo "Start Loading"
    overwrite_lines=${default_lines:-2}
    i=1
    echo "${default_text:-$i}
-"
    while true; do
        # -\|/
        symbol="-"
        case $i in
            1) 
            symbol="-"
            i=2
            ;;
            2) 
            symbol='\' 
            i=3
            ;;
            3) 
            symbol="|" 
            i=4
            ;;
            4) 
            symbol="/" 
            i=1
            ;;
        esac
        text="${default_text:-$i}
$symbol"
        echo -e "\x1B[${overwrite_lines}A\x1B[K$text"
        sleep 0.12s
    done
}

if [ "$1" = "loop" ]; then  
    default_text="$2"
    if [ -n "$default_text" ]; then
        default_lines="$(echo "$default_text" | wc -l)"
        default_lines=$(($default_lines+1))
    fi

    set_escape_character_variable
    load_symbols
fi