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
        echo -e "\e[${overwrite_lines}A\e[K$text"
        sleep 0.12s
    done
}

if [ "$1" = "loop" ]; then  
    default_text="$2"
    if [ -n "$default_text" ]; then
        default_lines="$(echo "$default_text" | wc -l)"
        default_lines=$(($default_lines+1))
    fi
    load_symbols
fi