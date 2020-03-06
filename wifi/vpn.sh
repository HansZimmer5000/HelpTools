# !/bin/sh

VPN_CMD="sudo openconnect"
HAW_VPN_URL="connect.haw-hamburg.de"

usage(){
    echo "
usage: vpn
    -c | --connect:     Connect to the HAW VPN server at '$HAW_VPN_URL'
    -h:                 Prints this help
"
}

case $1 in
	-c | --connect )	$VPN_CMD --protocol=anyconnect $HAW_VPN_URL
                    ;;
	* )               usage
esac
