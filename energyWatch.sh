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

	if [ "$1" == "-r" ]; then
		output="$temp"
	else
		output="Temp: $temp°C"
	fi
	echo $output
}

#Fan speed = 4137 [/min]
get_fan_speed() {
	speed=$(sudo tlp-stat -t | grep "speed")
	speed=${speed//"(fan1) "/""}
	speed=${speed//"Fan speed"/""}
	speed=${speed//"="/""}
	speed=${speed//"[/min]"/""}
	speed=${speed//" "/""}
	output="Fan: $speed/min"
	echo $output
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

	available_in_percent=$(bc <<<"scale=1;100-$memory_available*100/$memory_total")

	output="RAM: $available_in_percent%"
	echo $output
}

get_cpu_usage(){
	cpu_usage=($(cat /proc/loadavg)) 

	output="CPU: ${cpu_usage[0]}/4" #(one, five, fiveteen min average)
	echo $output
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
	output="Consumption: Bat0(${bat0_and_1[0]}) Bat1(${bat0_and_1[1]}) mW"
	echo $output
}

#Charge total = 73.6 [%]
get_energy_charge() {
	charge_percent=$(sudo tlp-stat -b | grep "Charge total")
	charge_percent=${charge_percent//"+++ "/""}
	charge_percent=${charge_percent//"Charge total"/""}
	charge_percent=${charge_percent//"="/""}
	charge_percent=${charge_percent//"[%]"/""}
	charge_percent=${charge_percent//" "/""}

	charge=$(sudo tlp-stat -b | grep "energy_now")
	charge_arr=($charge)
	# Go through all batteries in the system (Thinkpads X250 e.g. has two)
	mWh_total=0
	mWh_total=$(($mWh_total+${charge_arr[2]}))
	mWh_total=$(($mWh_total+${charge_arr[6]}))
    #while IFS= read -r line; do
		#arr=("$line")
		#mWh_total=$((mWh_total+${arr[2]})) 
    #done < <(echo "$charge") #<-- Does not work with "watch" command.

	# Refactor code from get consumption
	consumption_=$(sudo tlp-stat -b | grep "power_now")
	consumption_=${consumption_//"/sys/class/power_supply/"/}
	consumption_=${consumption_//"/power_now"/}
	consumption_=${consumption_//"BAT0"/""}
	consumption_=${consumption_//"BAT1"/""}
	consumption_=${consumption_//"="/""}
	consumption_=${consumption_//"[mW]"/""}
	consumption_=${consumption_//" "/""}

	bat0_and_1_=($(echo "$consumption_"))
	consumption_total_=${bat0_and_1_[0]}
	consumption_total_=$((consumption_total_+${bat0_and_1_[1]}))
	
	if [ "$consumption_total_" -le 0 ]; then
		# Laptopt is most certainly on A/C.
		consumption_total_=1
	fi	

	hours_left=$((mWh_total/consumption_total_))

	hours_left_tmp=$(awk "BEGIN {print $mWh_total/$consumption_total_}")
	#minutes_left=$(python -c "print(int(($hours_left_tmp-$hours_left)*60))")
	minutes_left=$(echo | awk "{printf(\"%d\n\", ($hours_left_tmp-$hours_left)*60 )}" )

	output="Charge Left: $charge_percent% ($hours_left h $minutes_left m left)"
	echo $output
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

if [ "$1" == "-csv" ]; then
	if [ -z "$2" ]; then
		echo "Need CSV Filename"
	else
		# TODO only raw output to csv file
		# Print Date
		watch -n 1 "print_exhausts"
	fi
else 
	# Do not print date as it is already shown in watch.
	watch -n 1 "print_exhausts"
fi


