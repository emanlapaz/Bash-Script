#!/bin/bash
#Author: Eugenio Manlapaz 
#Student number 20100113
#Script Description: Remove script

clear

#Ansi Colours to highlight words
yellow="\e[0;93m"
green="\e[0;92m"
blue="\e[0;94m"
red="\e[0;91m"
reset="\e[0m"
bold="\e[1m"
uline="\e[4m"

header=`echo -e "${blue}${bold}WELCOME TO BUILDING ENERGY RATING SURVEY IRELAND${reset}"`
space=`echo -e " \n"`
menu=`echo -e "${yellow}DELETE MENU: choose an OPTION and press ENTER: ${reset}"`

echo -e "$header \n"
echo -e "SELECT OPTIONS: \n"
PS3="$menu"
echo "$space"
options=("SEARCH and DELETE" "DELETE ALL records" "Back to MAIN MENU")
select opt in "${options[@]}"
do
	case $opt in
	"SEARCH and DELETE")
		clear
		names=`awk '{print $1, $2}' BERdetails`
		echo -e "${green}$names ${reset} \n"
		echo "$space"
		echo "Who's record will you delete?(Case sensitive,type the FULL name)"
		read -p "type the full name: " name
		while [[ -z $name ]]
		do
			clear
			echo -e "ERROR \n"
			echo -e "${red}Invalid input... NAME cannot be blank${reset} \n"
			echo -e "Please enter ${green}NAME${reset} or type ${yellow}quit${reset} to go back to ${yellow}PREVIOUS MENU: ${reset} \n"
			echo -e "NAME LIST: \n"
			echo -e "${green}$names${reset}"
			read -p "type the FULL NAME: " name
			if [ $name == "quit" ]
			then
				clear
				./remove.sh
				exit 1
			fi
		done
		sed -i "/$name/d" BERdetails
		echo -e "You have DELETED $name 's record \n" 
		echo -e  "Back to previous MENU \n "
		echo "$space"
		;;

	"DELETE ALL records")
	clear
	echo -e  "${red}${bold}${uline}Warning! DELETING ALL RECORDS ${reset} \n"
	read -p "Are you sure that you want to DELETE ALL RECORDS? [YES/NO]" input
	case $input in
		[Yy][Ee][Ss])
		> BERdetails
		echo -e "${red}ALL RECORDS DELETED${reset}"
		;;
		[Nn][Oo])
		echo -e "${green}RECORDS NOT DELETED${reset}...Back to Previous Menu"
		;;
		*)
		echo "invalid input... back to previous menu"
		;;
	esac
	;;
	"Back to MAIN MENU")
	clear
	./menu.sh
	exit 0
	;;
	
	*)
	echo "Invalid input... Choose from the OPTIONS"
	;;
esac
done
