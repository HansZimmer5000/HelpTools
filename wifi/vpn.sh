# !/bin/sh

CISCO_VPN_SCRIPT="/opt/cisco/anyconnect/bin/vpn"
HAW_VPN_URL="connect.haw-hamburg.de"

usage(){
    echo "
usage: vpn
    -c | --connect:     Connect to the HAW VPN server at '$HAW_VPN_URL'
    -d | --disconnect:  Disconnect from the current vpn server
    -h:                 Prints this help
"
}

if [ -z "$1" ]; then
    usage
else
    case $1 in
        -c | --connect )        $CISCO_VPN_SCRIPT connect $HAW_VPN_URL
                                ;;
        -d | --disconnect )     $CISCO_VPN_SCRIPT disconnect
                                ;;
        * )                     usage
    esac
fi