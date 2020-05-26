#!/bin/bash

#2020-05-26-19-52-08
get_date() {
	echo $(date +%F-%H-%M-%S)
}

#/proc/acpi/ibm/thermal = 46 0 0 0 0 0 0 0 [°C]
get_temp() {
	temp=$(sudo tlp-stat -t | grep "C]")
	echo $temp
}

#Fan speed = 4137 [/min]
get_fan_speed() {
	speed=$(sudo tlp-stat -t | grep "speed")
	speed=${speed//"(fan1) "/""}
	echo $speed
}

get_memory_usage() {
	memory_total=$(cat /proc/meminfo | grep "MemTotal")
	memory_available=$(cat /proc/meminfo | grep "MemAvailable")

	memory_total=${memory_total//"MemTotal:"/""}
	memory_total=${memory_total//"kB"/""}
	memory_total=${memory_total//" "/""}

	memory_available=${memory_available//"MemAvailable:"/""}
	memory_available=${memory_available//"kB"/""}
	memory_available=${memory_available//" "/""}

	available_in_percent=$(bc <<<"scale=1;$memory_available*100/$memory_total")
	echo $available_in_percent
}

get_energy_consumption() {
	consumption=$(sudo tlp-stat -b | grep "power_now")
	consumption=${consumption//"/sys/class/power_supply/"/}
	consumption=${consumption/"[mW]"/"[mW]"}
	consumption=${consumption//"    "/""}
	consumption=${consumption//"  "/" "}
	echo $consumption
}

#BAT0/power_now = 0 [mW]
#BAT1/power_now = 0 [mW]
#Charge total = 73.6 [%]
get_energy_charge() {
	charge=$(sudo tlp-stat -b | grep "Charge total")
	charge=${charge//"+++ "/""}
	echo $charge
}

print_exhausts() {
	date=$(get_date)
	temp=$(get_temp)
	speed=$(get_fan_speed)

	# TODO get used memory in Percent
	memory=$(get_memory)

	consumption=$(get_energy_consumption)
	charge=$(get_energy_charge)

	echo $date
	echo $temp
	echo $speed
	echo $consumption
	echo $charge
}

export -f print_exhausts get_date get_temp get_memory get_fan_speed get_energy_consumption get_energy_charge

#watch -n 1 "print_exhausts"

get_memory

#cat /proc/loadavg
#cat /proc/stat
