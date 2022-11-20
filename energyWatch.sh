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

	temp=$(echo "$powermetrics_data" | grep -i "CPU die temperature")
	temp=$(remove_all_from_text "$temp" " C" "CPU die temperature: ")

	speed=$(echo "$powermetrics_data" | grep -i "rpm")
	speed=$(remove_all_from_text "$speed" "Fan: " " rpm")
}

update_sysctl_data(){
	sysctl_data=$(sysctl machdep)

	temp=$(echo "$sysctl_data" | grep machdep.xcpm.cpu_thermal_level | sed 's|machdep.xcpm.cpu_thermal_level: ||')
	temp_gpu=$(echo "$sysctl_data" | grep machdep.xcpm.gpu_thermal_level | sed 's|machdep.xcpm.gpu_thermal_level: ||')
	speed=3
	#available_in_percent=$(echo "$sysctl_data" | grep hw.memsize)

	free=($(vm_stat | grep free | sed 's|\.||g')) ; free=${free[2]}
	spec=($(vm_stat | grep speculative | sed 's|\.||g')) ; spec=${spec[2]}
	size=($(vm_stat | grep "page size of" | sed 's|\.||g')) ; size=${size[7]}
	memory_available=$(((free*size)+(spec*size)))
	memory_total=($(sysctl hw.memsize)) ; memory_total=${memory_total[1]}
	available_in_percent=$(bc <<<"scale=1;$memory_available*100/$memory_total")

	cpu_usage=($(sysctl vm.loadavg)) ; cpu_usage=${cpu_usage[2]}
	cpu_cores=$(sysctl hw.logicalcpu_max | cut -d" " -f2)
	batt_raw=($(pmset -g batt | tail -n 1 | sed 's|%||g' | sed 's|;||g'))
	bat0_and_1="n/a"
	charge_percent=${batt_raw[2]}
	hours_left=$(echo ${batt_raw[4]} | cut -d":" -f1)
	minutes_left=$(echo ${batt_raw[4]} | cut -d":" -f2)

}

update_tlpstatt_data(){
	tlpstatt_data=$(sudo tlp-stat -t)
	temp=$(echo "$tlpstatt_data" | grep "C]") #/proc/acpi/ibm/thermal = 46 0 0 0 0 0 0 0 [°C]
	temp=$(remove_all_from_text "$temp" "/proc/acpi/ibm/thermal = " " 0 0 0 0 0 0 0" "[°C]")

	speed=$(echo "$tlpstatt_data" | grep "speed")
	speed=$(remove_all_from_text "$speed" "(fan1) " "Fan speed" "=" "[/min]" " ")

	temp_gpu=$(echo "$powermetrics_data" | grep -i "GPU die temperature")
	temp_gpu=$(remove_all_from_text "$temp" " C" "GPU die temperature: ")
}

update_tlpstatb_data(){
	tlpstatb_data=$(sudo tlp-stat -b)

	consumption=$(echo "$tlpstatb_data" | grep "power_now")
	consumption=$(remove_all_from_text "$consumption" "/sys/class/power_supply/" "/power_now" "BAT0" "BAT1" "=" "[mW]" " ")
	bat0_and_1=($consumption)
	#bat0=${bat0_and_1[0]} Internal X250 Battery
	#bat1=${bat0_and_1[1]} External X250 Battery
}

update_nvidiasettings_data(){
	temp_gpu="$(nvidia-settings -q ThermalSensorReading | grep Attribute)"
	temp_gpu=${temp_gpu: -4}
	temp_gpu=$(remove_all_from_text "$temp_gpu" " " "." ":")
}


get_date() {
	#2020-05-26-19-52-08
	date +%F-%H-%M-%S
}

get_cpu_temp() {
	format_output "$temp" "$temp" "CPU Temp: ${temp}°C"
}

get_gpu_temp(){
	format_output "$temp_gpu" "$temp_gpu" "GPU Temp: ${temp_gpu}°C"
}

#Fan speed = 4137 [/min]
get_fan_speed() {
	format_output "$speed" "$speed" "Fan: $speed rpm"
}

get_memory_usage() {
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
	format_output "${bat0_and_1[*]}" "${bat0_and_1[0]}|${bat0_and_1[1]}" "Consumption: Bat0(${bat0_and_1[0]}) Bat1(${bat0_and_1[1]}) mW"
}

#Charge total = 73.6 [%]
get_energy_charge() {
	if which tlp-stat &>/dev/null; then
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
		
		if [ -z "$consumption_total_" ] || [ "$consumption_total_" -le 0 ]; then
			# Laptop is most certainly on A/C.
			consumption_total_=1
		fi	

		hours_left=$((mWh_total/consumption_total_))

		hours_left_tmp=$(awk "BEGIN {print $mWh_total/$consumption_total_}")
		#minutes_left=$(python -c "print(int(($hours_left_tmp-$hours_left)*60))")
		minutes_left=$(echo | awk "{printf(\"%d\n\", ($hours_left_tmp-$hours_left)*60 )}" )

	fi
	# TODO MacOS

	format_output "$charge_percent" "$charge_percent% ($hours_left h $minutes_left m left)" "Charge Left: $charge_percent% ($hours_left h $minutes_left m left)"
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
		if whereis sysctl &>/dev/null; then
			update_sysctl_data
		elif whereis powermetrics &>/dev/null; then
			update_powermetrics_data
		elif whereis tlp-stat &>/dev/null; then
			update_tlpstatt_data
			update_tlpstatb_data
		fi

		clear
		print_exhausts

		sleep ${sleep_duration}
	done
fi
