#!/bin/sh
set -e #Exit on error

print_help(){
	echo "This tool sets a specific tlp config and then restart the tlp.service"
	echo "Only one input is needed, according to the given number a specific config will be set:"
	echo "0. template_config" 
	echo "1. power_config" 
	echo "2. performance_config" 
	echo 
	echo Current Config: $(cat ./current_config)
}

new_config=""

if [ "$#" -eq 0 ]; then
	print_help
elif [ "$1" -eq 0 ]; then
	new_config="template_config"
elif [ "$1" -eq 1 ]; then
	new_config="power_config"
elif [ "$1" -eq 2 ]; then
	new_config="performance_config"
else 
	print_help
fi

if [ "$new_config" != "" ]; then 
	echo "Beware! This will replace the /etc/default/tlp file"
	read -p "Setting $new_config, continue?"	
	sudo cp -f ./$new_config /etc/tlp.conf

	echo "Restarting tlp.service"
	sudo systemctl restart tlp.service

	echo $new_config > ./current_config
	sudo systemctl status tlp.service
fi
