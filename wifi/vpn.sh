# !/bin/sh

VPN_CMD="sudo openconnect"
HAW_VPN_URL="vpn.haw-hamburg.de"

usage(){
    echo "
usage: vpn
    -c | --connect:     Connect to the HAW VPN server at '$HAW_VPN_URL'
    -h:                 Prints this help
"
}

case $1 in
	-c | --connect )	
        $VPN_CMD --protocol=anyconnect $HAW_VPN_URL
        ;;
	* ) 
        usage
esac

# Legacy code with anyconnect
#PATH_VPNAGENTD="/etc/rc.d"
#PATH_VPN="/opt/cisco/anyconnect/bin"

#sudo $PATH_VPNAGENTD/vpnagentd start
#sudo $PATH_VPN/vpnui connect $HAW_VPN_URL
#sudo $PATH_VPN/vpnui
