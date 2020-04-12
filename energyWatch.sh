#!/bin/bash

print_exhausts() {
	temp=$(sudo tlp-stat -t | grep "C]")
	speed=$(sudo tlp-stat -t | grep "speed")

	consumption=$(sudo tlp-stat -b | grep "power_now")
	charge=$(sudo tlp-stat -b | grep "Charge total")

	speed=${speed//"(fan1) "/""}

	consumption=${consumption//"/sys/class/power_supply/"/}
	consumption=${consumption/"[mW]"/"[mW]"}
	consumption=${consumption//"    "/""}
	consumption=${consumption//"  "/" "}

	charge=${charge//"+++ "/""}

	echo $temp
	echo $speed
	echo "$consumption"
	echo $charge
}

export -f print_exhausts

watch -n 1 "print_exhausts"

cat /proc/loadavg
cat /proc/stat
