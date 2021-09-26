#!/bin/bash
set -e 

print_help(){
	echo "
This tool sets a specific tlp config and then restart the tlp.service
Only one input is needed after executing the script: 
According to the given number a specific config will be set:
0. template_config
1. power_config
2. performance_config

Current Config: ${current_config}
"
}

current_config=$(cat ./current_config || echo 'n/a')
new_config=""

select input in template_config power_config performance_config; do	
	case $input in
		"")
			print_help
			;;
		*_config)
			new_config="$input"
			;;
	esac
	break
done

if [ -n "$new_config" ]; then 
	echo "Beware! This will replace the /etc/default/tlp file"
	read -rp "Setting $new_config, continue?"	
	sudo cp -f ./"$new_config" /etc/tlp.conf

	echo "Restarting tlp.service"
	sudo systemctl restart tlp.service

	echo "$new_config" > ./current_config
	sudo systemctl status tlp.service
fi
