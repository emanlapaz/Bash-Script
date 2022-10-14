#!/bin/bash
#Author: Eugenio Manlapaz
#Student number 20100113
#Script Description: This is the add script

clear

#Ansi Colors to highligh words
yellow="\e[0;93m"
green="\e[0;92m"
blue="\e[0;94m"
red="\e[0;91m"
reset="\e[0m"
bold="\e[1m"
uline="\e[4m"

header=`echo -e "${blue}${bold}WELCOME TO BUILDING ENERGY RATING SURVEY IRELAND${reset}"`
space=`echo -e "\n"`
menu=`echo -e "${yellow}ADD MENU: choose and option and press ENTER: ${reset}"`


#I used a PS3 for my menu
echo -e "$header \n"
echo "SELECT OPTIONS:"
PS3="$menu"
echo "$space"
options=("Add Data" "Back to Main Menu")
select opt in "${options[@]}"
do
	case $opt in
	"Add Data")
	clear
	echo "Please enter the details below: "

#blank user input or a number for the names will throw an error
	echo "$space"
	read -p "Enter the FIRST name: " firstName
	while [[ -z "$firstName" || ! "$firstName" =~ [a-zA-Z]+$ ]]
	do
		clear
		echo -e "ERROR \n "
		echo -e "${red}Invalid input... FIRST name cannot be blank or a number.${reset} \n"
		echo -e "Please enter ${green} FIRST name ${reset} or type ${yellow} quit ${reset} to go back to ${yellow}PREVIOUS MENU:${reset} \n"
		read -p "Enter the FIRST name: " firstName
		if [ $firstName == "quit" ]
		then
			clear
			./add.sh
			exit 1
		fi
	done
	clear
	echo "$space"
	read -p "Enter the LAST name: " lastName
	while [[ -z "$lastName" || ! "$lastName" =~ [a-zA-Z]+$ ]]
	do
		clear
		echo -e "ERROR \n"
		echo -e "${red}Invalid input... LAST name cannot be blank or a number.${reset} \n"
		echo -e "Please enter ${green} LAST name ${reset} or type ${yellow} quit ${reset} to go back to the ${yellow}PREVIOUS MENU:${reset} \n"
		read -p "Enter the LAST name: " lastName
		if [ $lastName == "quit" ]
		then
			clear
			./add.sh
			exit 1
		fi
	done

#I used the not equal (-ne) to make sure user input is 7 characters for the eircode
	clear
	echo "$space"
	read -p "Enter the EIRCODE ( 7 characters): " eircode
	while [[ -z "$eircode" || ${#eircode} -ne 7 ]]
	do
		clear
		echo -e "ERROR \n"
		echo -e "${red}Invalid input... EIRCODE cannot be blank or more/less than 7 characters.${reset} \n"
		echo -e "Please enter ${green} EIRCODE ${reset} or type ${yellow}quit${reset} to go back to ${yellow}PREVIOUS MENU:${reset} \n"
		read -p "Enter the EIRCODE (7 characters): " eircode
		if [ $eircode == "quit" ]
		then
			clear
			./add.sh
			exit 1
		fi
	done

	clear
	echo "$space"
	read -p "Enter PHONE number (10 digits): " phone
	while [[ -z "$phone" || ${#phone} -ne 10 || ! "$phone" =~ [[:digit:]] ]]
	do
		clear
		echo -e "ERROR \n"
		echo -e "${red}Invalid input... PHONE number cannot be blank, letters or more/less than 10 digits.${reset} \n"
		echo -e "Please enter ${green} PHONE number ${reset} or type ${yellow}quit${reset} to go back to ${yellow}PREVIOUS MENU:${reset} \n"
		read -p "Enter PHONE number (10 digits): " phone
		if [ $phone == "quit" ]
		then
			clear
			./add.sh
			exit 1
		fi
	done 

#I used a regex pattern for the email. If the pattern is not followed it will throw an ERROR
	clear
	echo "$space"
	read -p "Enter EMAIL address (email@xxxx.com): " email
	while [[ -z "$email" || ! "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]
	do
		clear
		echo -e "ERROR \n"
		echo -e "${red}Invalid input... EMAIL cannot be blank or not in the (email@xxxx.com) pattern ${reset} \n"
		echo -e "Please enter ${green} EMAIL ${reset} or type ${yellow}quit${reset} to go back to ${yellow}PREVIOUS MENU:${reset} \n"
		read -p "Enter EMAIL address (email@xxxx.com): " email
		if [ $email == "quit" ]
		then
			clear
			./add.sh
			exit 1
		fi
	done

#I used a regex to limit the input to the letters A-E only. It will also give an error if the input lenght is more than 1.
	clear
	echo "$space"
	read -p "Enter the Building Energy Rating (one letter from A - E only): " ber
	while [[ -z "$ber" || ${#ber} -ne 1 || ! "$ber" =~ ^[A-E]+$ ]]
	do
		clear
		echo -e "ERROR \n"
		echo -e "${red}Invalid input... BER cannot be blank, has more than 1 character or not from A - E(case sensitive). ${reset} \n"
		echo -e "Please enter the ${green}Building Energy Rating${reset} or type ${yellow}quit${reset} to go back to the ${yellow}PREVIOUS MENU${reset} \n"
		read -p "Enter the  Building Energy Rating (one letter from A - E only): " ber
		if [ $ber == "quit" ]
		then
			clear
			./add.sh
			exit 1
		fi
	done

	clear
	echo "$space"
	read -p "Enter the YEAR the house was built (example: 2020): " year
	while [[ -z "$year" || ${#year} -ne 4 || ! "$year" =~ [[:digit:]] ]]
	do
		clear
		echo -e "ERROR \n"
		echo -e "${red}Invalid input... YEAR cannot be blank, more/less than 4 character or letters. ${reset} \n"
		echo -e "Please enter the ${green} YEAR${reset} the house was built or type ${yellow}quit${reset} to go back to the ${yellow}PREVIOUS MENU:${reset} \n"
		read -p "Enter the YEAR the house was built (example: 2020): " year
		if [ $year == "quit" ]
		then
			clear
			./add.sh
			exit 1
		fi
	done

	clear

	echo "$space"
	echo -e "These are the data you entered: \n"
	echo -e "Name: ${yellow} $firstName $lastName ${reset} \n"
	echo -e "Eircode: ${yellow} $eircode ${reset} \n"
	echo -e "Phone Number: ${yellow} $phone ${reset} \n"
	echo -e "Email Address: ${yellow}$email ${reset} \n"
	echo -e "Building Energy Rating (BER):${yellow} $ber ${reset} \n"
	echo -e "Year house built: ${yellow} $year ${reset} \n"
	echo "$space"
	echo -e "${yellow}${bold}SAVE DATA? [Y/N] ${reset}"	
	read save
		case $save in
		[yY])
			clear
			echo "$firstName $lastName EIRCODE:$eircode PHONE:$phone $email BER:$ber YEAR:$year" >> BERdetails
			echo -e "${Yyellow}Data Saved Successfully${reset} \n"
			;;
		[nN])
			clear
			echo -e "${yellow}DATA NOT SAVED ${reset} \n"
			echo -e "Back to ${yellow} PREVIOUS MENU${reset}"
			./add.sh
			exit 1
			;;

		*)
			clear
			echo -e "${red}Invalid input${reset}${yellow} DATA NOT SAVED ${reset}"
			echo -e "Back to ${yellow} PREVOIUS MENU${reset}"
			./add.sh
			exit 1
			;;
		esac

	;;

	"Back to Main Menu")
	clear
	./menu.sh
	exit 0

	;;
	
	*) 
	clear
	echo -e "${red}INVALID OPTION ${reset} \n" 
	echo "press enter to go back to OPTIONS"
	./add.sh
	exit 1
	;;
esac
done
