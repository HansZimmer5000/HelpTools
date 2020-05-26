#!/bin/bash

#2020-05-26-19-52-08
get_date() {
	echo $(date +%F-%H-%M-%S)
}

#/proc/acpi/ibm/thermal = 46 0 0 0 0 0 0 0 [°C]
get_temp() {
	temp=$(sudo tlp-stat -t | grep "C]")
	temp=${temp//"/proc/acpi/ibm/thermal = "/""}
	temp=${temp//" 0 0 0 0 0 0 0 [°C]"/""}
	echo $temp
}

#Fan speed = 4137 [/min]
get_fan_speed() {
	speed=$(sudo tlp-stat -t | grep "speed")
	speed=${speed//"(fan1) "/""}
	speed=${speed//"Fan speed"/""}
	speed=${speed//"="/""}
	speed=${speed//"[/min]"/""}
	speed=${speed//" "/""}
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

get_cpu_usage(){
	cpu_usage=($(cat /proc/loadavg)) 

	echo ${cpu_usage[1]} #(one, five, fiveteen min average)
}

#BAT0/power_now = 0 [mW]
#BAT1/power_now = 0 [mW]
get_energy_consumption() {
	consumption=$(sudo tlp-stat -b | grep "power_now")
	consumption=${consumption//"/sys/class/power_supply/"/}
	consumption=${consumption//"/power_now"/}
	consumption=${consumption//"BAT0"/""}
	consumption=${consumption//"BAT1"/""}
	consumption=${consumption//"="/""}
	consumption=${consumption//"[mW]"/""}
	consumption=${consumption//" "/""}

	bat0_and_1=($(echo "$consumption"))
	#bat0=${bat0_and_1[0]} Internal X250 Battery
 	#bat1=${bat0_and_1[1]} External X250 Battery
	echo ${bat0_and_1[@]}
}

#Charge total = 73.6 [%]
get_energy_charge() {
	charge=$(sudo tlp-stat -b | grep "Charge total")
	charge=${charge//"+++ "/""}
	charge=${charge//"Charge total"/""}
	charge=${charge//"="/""}
	charge=${charge//"[%]"/""}
	charge=${charge//" "/""}
	echo $charge
}

print_exhausts() {
	get_date
	get_temp
	get_fan_speed
	get_memory_usage
	get_cpu_usage
	get_energy_consumption
	get_energy_charge
}

export -f print_exhausts get_date get_temp get_memory_usage get_cpu_usage get_fan_speed get_energy_consumption get_energy_charge

watch -n 1 "print_exhausts"

