load_symbols(){
    echo '-'
    i=1
    while true; do
        # -\|/-\|/-
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

        echo -e "\e[1A\e[K$symbol"
        sleep 0.12s
    done
}

if [ "$1" = "loop" ]; then
    load_symbols
fi