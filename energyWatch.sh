#!/bin/bash

format_output(){
	data="$1"
	output_raw="$2"
	output_nice="$3"

	if [ -n "$data" ]; then
		if [ -n "$return_raw_output" ]; then
			echo "$output_raw"
		else
			echo "$output_nice"
		fi
	else 
		echo "$empty_value"
	fi
}

remove_all_from_text(){
	text="$1"
	shift 1

	for substr in "$@"; do
		# ${text//"$substr"/""} Would be nicer, but does not handle space in substr
		text="$(echo "$text" | sed "s|$substr|| g")"
	done

	echo "$text"
}

update_powermetrics_data(){
	powermetrics_data=$(sudo powermetrics --samplers smc -n 1)
}

update_tlpstatt_data(){
	tlpstatt_data=$(sudo tlp-stat -t)
}

update_tlpstatb_data(){
	tlpstatb_data=$(sudo tlp-stat -b)
}

get_date() {
	#2020-05-26-19-52-08
	date +%F-%H-%M-%S
}

get_cpu_temp() {
	local temp

	if [ -n "$(whereis tlp-stat)" ]; then
		temp=$(echo "$tlpstatt_data" | grep "C]") #/proc/acpi/ibm/thermal = 46 0 0 0 0 0 0 0 [°C]
		temp=$(remove_all_from_text "$temp" "/proc/acpi/ibm/thermal = " " 0 0 0 0 0 0 0" "[°C]")
	elif [ -n "$(whereis powermetrics)" ]; then
		temp=$(echo "$powermetrics_data" | grep -i "CPU die temperature")
		temp=$(remove_all_from_text "$temp" " C" "CPU die temperature: ")
	fi

	format_output "$temp" "$temp" "CPU Temp: ${temp}°C"
}

get_gpu_temp(){
	local temp

	if [ -n "$(whereis nvidia-settings)" ]; then
		temp="$(nvidia-settings -q ThermalSensorReading | grep Attribute)"
		temp=${temp: -4}
		temp=$(remove_all_from_text "$temp" " " "." ":")
	elif [ -n "$(whereis powermetrics)" ]; then
		temp=$(echo "$powermetrics_data" | grep -i "GPU die temperature")
		temp=$(remove_all_from_text "$temp" " C" "GPU die temperature: ")
	fi

	format_output "$temp" "$temp" "GPU Temp: ${temp}°C"
}

#Fan speed = 4137 [/min]
get_fan_speed() {
	local speed

	if [ -n "$(whereis tlp-stat)" ]; then
		speed=$(echo "$tlpstatt_data" | grep "speed")
		speed=$(remove_all_from_text "$speed" "(fan1) " "Fan speed" "=" "[/min]" " ")
	elif [ -n "$(whereis powermetrics)" ]; then
		speed=$(echo "$powermetrics_data" | grep -i "rpm")
		speed=$(remove_all_from_text "$speed" "Fan: " " rpm")
	fi

	format_output "$speed" "$speed" "Fan: $speed rpm"
}

get_memory_usage() {
	local available_in_percent

	if [ -f "/proc/meminfo" ]; then
		memory_total_raw=$(grep "MemTotal" /proc/meminfo)
		memory_available_raw=$(grep "MemAvailable" /proc/meminfo)
		memory_total=$(remove_all_from_text "$memory_total_raw" "MemTotal:" "kB" " ")
		memory_available=$(remove_all_from_text "$memory_available_raw" "MemAvailable:" "kB" " ")

		available_in_percent=$(bc <<<"scale=1;100-$memory_available*100/$memory_total")
	fi 
	# TODO MacOS

	format_output "$available_in_percent" "$available_in_percent" "RAM: $available_in_percent%"
}

get_cpu_usage(){
	local cpu_cores
	local cpu_usage

	if [ -f "/proc/loadavg" ]; then
		cpu_usage=($(cat /proc/loadavg)) 
		cpu_cores=$(grep "cpu cores" /proc/cpuinfo | head -n 1  | awk '{print $4 }')
		# TODO replace cpu_cores with threads
	fi
	# TODO MacOS

	# cpu_usage[0/1/2] contains one[0], five[1], fiveteen[2] min average
	format_output "$cpu_usage" "${cpu_usage[0]}/$cpu_cores" "CPU: ${cpu_usage[0]}/$cpu_cores"
}

#BAT0/power_now = 0 [mW]
#BAT1/power_now = 0 [mW]
get_energy_consumption() {
	local bat0_and_1

	if [ -n "$(whereis tlp-stat)" ]; then
		consumption=$(echo "$tlpstatb_data" | grep "power_now")
		consumption=$(remove_all_from_text "$consumption" "/sys/class/power_supply/" "/power_now" "BAT0" "BAT1" "=" "[mW]" " ")

		bat0_and_1=($consumption)
		#bat0=${bat0_and_1[0]} Internal X250 Battery
		#bat1=${bat0_and_1[1]} External X250 Battery
	fi
	# TODO MacOS

	format_output "${bat0_and_1[*]}" "${bat0_and_1[0]}|${bat0_and_1[1]}" "Consumption: Bat0(${bat0_and_1[0]}) Bat1(${bat0_and_1[1]}) mW"
}

#Charge total = 73.6 [%]
get_energy_charge() {
	if [ -n "$(whereis tlp-stat)" ]; then
		grep_word="Charge total"
		charge_percent=$(echo "$tlpstatb_data" | grep "$grep_word")
		if [ -z "$charge_percent" ]; then
			grep_word="Charge  "
			charge_percent=$(echo "$tlpstatb_data" | grep "$grep_word")
		fi
		charge_percent=$(remove_all_from_text "$charge_percent" "+++ " "$grep_word" "=" "[%]" " ")

		charge=$(echo "$tlpstatb_data" | grep "energy_now")
		charge_arr=($charge)
		# Go through all batteries in the system (Thinkpads X250 e.g. has two)
		mWh_total=0
		mWh_total=$((mWh_total+charge_arr[2]))
		if [ -n "${charge_arr[6]}" ]; then
			mWh_total=$((mWh_total+charge_arr[6]))
		fi

		# Refactor code from get consumption
		consumption_=$(echo "$tlpstatb_data" | grep "power_now")
		consumption_=$(remove_all_from_text "$consumption_" "/sys/class/power_supply/" "/power_now" "BAT0" "BAT1" "=" "[mW]" " ")

		bat0_and_1_=($consumption_)
		consumption_total_=${bat0_and_1_[0]}
		if [ -n "${bat0_and_1_[1]}" ]; then
			consumption_total_=$((consumption_total_+bat0_and_1_[1]))
		fi
		
		if [ "$consumption_total_" -le 0 ]; then
			# Laptopt is most certainly on A/C.
			consumption_total_=1
		fi	

		hours_left=$((mWh_total/consumption_total_))

		hours_left_tmp=$(awk "BEGIN {print $mWh_total/$consumption_total_}")
		#minutes_left=$(python -c "print(int(($hours_left_tmp-$hours_left)*60))")
		minutes_left=$(echo | awk "{printf(\"%d\n\", ($hours_left_tmp-$hours_left)*60 )}" )

		format_output "$charge_percent" "$charge_percent% ($hours_left h $minutes_left m left)" "Charge Left: $charge_percent% ($hours_left h $minutes_left m left)"
	fi
	# TODO MacOS
}

print_exhausts() {
	get_date
	get_cpu_temp
	get_gpu_temp
	get_fan_speed
	get_memory_usage
	get_cpu_usage
	get_energy_consumption
	get_energy_charge
}

get_csv_head(){
	echo "Date${delimiter}CPU Temp${delimiter}GPU Temp${delimiter}CPU Fan Speed${delimiter}Memory Usage${delimiter}CPU Usage${delimiter}Energy Consumption${delimiter}Energy Charge" 
}

get_csv_entry(){
	echo "$(get_date)${delimiter}$(get_cpu_temp)${delimiter}$(get_gpu_temp)${delimiter}$(get_fan_speed)${delimiter}$(get_memory_usage)${delimiter}$(get_cpu_usage)${delimiter}$(get_energy_consumption)${delimiter}$(get_energy_charge)"
}

empty_value="n/a"
return_raw_output=""
sleep_duration=2 # TODO on MacOS without the 's'

flag="$1"

if [ "$flag" = "source" ]; then
	return 0
elif [ "$flag" == "-csv" ]; then
	csv_file="$2"
	if [ -z "$csv_file" ]; then
		echo "Need CSV Filename"
	else
		return_raw_output=true
		delimiter=";"
		get_csv_head > "$csv_file"
		while true; do
			get_csv_entry >> "$csv_file"
			sleep ${sleep_duration}
		done
	fi
else
	while true; do
		update_powermetrics_data
		update_tlpstatt_data
		update_tlpstatb_data

		clear || clr
		print_exhausts

		sleep ${sleep_duration}
	done
fi
