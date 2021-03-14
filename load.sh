load_symbols(){
    echo "Start Loading"
    #TODO flexible set 'overwrite_lines=2' and adjust first echo
    i=1
    echo "$i
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
        text="$i
$symbol"
        echo -e "\e[2A\e[K$text"
        sleep 0.12s
    done
}

if [ "$1" = "loop" ]; then
    load_symbols
fi