#!/bin/bash
#Author: Eugenio Manlapaz
#Student number 20100113
#Script Description: Menu script for Home BER Log 

clear

#Ansi Colors used to highlight words
yellow="\e[0;93m"
green="\e[0;92m"
blue="\e[94m"
red="\e[0;91m"
reset="\e[0m"
bold="\e[1m"
uline="\e[4m"

header=`echo -e  "${blue}${bold}WELCOME TO BUILDING ENERGY RATING SURVEY IRELAND${reset} "`
menu=`echo -e "${yellow}MAIN MENU: choose from (1-5) and press ENTER:${reset} "`


clear
echo -e "$header \n"
echo -e "SELECT OPTIONS: \n"
PS3="$menu "
options=("ADD Data" "SEARCH Data" "DELETE Data" "SEND an Email" "EXIT")
select opt in "${options[@]}"
do
	case $opt in 
		"ADD Data")
			clear
			./add.sh
			exit 0
			;;
		"SEARCH Data")
			clear
			./search.sh
			exit 0
			;;
		"DELETE Data")
			clear
			./remove.sh
			exit 0
			;;
		"SEND an Email")
			clear
			./email.sh
			exit 0
			;;
		"EXIT")
			clear
			echo -e "${yellow}Thank you for your time.. Goodbye${reset}"
			break
			exit 0
			;;
		* )
			echo -e "${yellow}Invalid input... Choose an OPTION:${reset}"
			;;
	esac
done
