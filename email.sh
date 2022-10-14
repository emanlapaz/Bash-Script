#!/bin/bash
c#Author: Eugenio Manlapaz 
#Student number: 20100113
#This is the email script

clear

#Ansi colours to highlight words
yellow="\e[0;93m"
green="\e[0;92m"
blue="\e[0;94m"
red="\e[0;91m"
reset="\e[0m"
bold="\e[1m"
uline="\e[4m"

header=`echo -e "${blue}${bold}WELCOME TO BUILDING ENERGY RATING SURVEY IRELAND${reset}"`
space=`echo -e "\n"`
menu=`echo -e "${yellow}EMAIL MENU: choose an OPTION and press ENTER: ${reset}"`

echo -e "$header \n"
echo -e "SELECT OPTIONS \n"
PS3="$menu"
echo "$space"
options=("SEND an Email" "SEND an Email to all" "CHECK Email" "Back to MAIN MENU")
select opt in "${options[@]}"
do
	case $opt in
	"SEND an Email")

		clear
		emailList=`awk '{print $1,$2,$5}' BERdetails`

		echo -e "${yellow}SEND an Email${reset} to a person from the LIST: \n"
		echo -e "${green}$emailList${reset} \n"
		echo "$space"
		read -p "Please type the EMAIL ADDRESS of the PERSON you want to email: " emailAdd
		while [[ -z "$emailAdd" || ! "$emailAdd" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]
		do
			clear
			echo -e "ERROR \n"
			echo -e "${red}Invalid input... EMAIL cannot be blank or not in the (email@xxx.xxx) pattern ${reset} \n"
			echo -e "Please enter an ${green}EMAIL ADDRESS${reset}from the list or type ${yellow}quit${reset} to go back to the ${yellow}PREVIOUS MENU${reset} \n"
			echo -e "${green}$emailList${reset} \n"
			read -p "Enter Email Address: " emailAdd
			if [ $emailAdd == "quit" ]
			then
				clear
				./email.sh
				exit 1
			fi
		done

		echo "Do you want to send an email to $emailAdd? [Y/N] \n"
		read -p "press [Y/N] :" input
		case $input in
			[Yy])
				echo -e  "COMPOSE email and SEND to ${green}$emailAdd${reset}"
				read -p "Subject:" subject
				read -p "Message:" message
				echo -e "This is your MESSAGE:${yellow}$message ${reset} \n"
				echo "$message" | mail -s "$subject" $emailAdd
				echo -e "Email SENT to ${green}$emailAdd${reset} \n"
				;;
		
			[Nn])
				echo -e "Back to previous menu \n"
				;;
			*)
				echo "invalid input... back to previous menu"
				;;
		esac
	;;
	
	"SEND an Email to all")
		
		clear
		allEmail=`awk '{print $5}' BERdetails`
		echo -e "These are the names and email addresses on record \n"
		echo -e "${green}$allEmail${reset} \n"
		echo -e "Send an email to all address in the record? [Y/N] \n"
		read -p "press Y/N: " input
		case $input in
			[Yy])
				allEmail=`awk '{print $5}' BERdetails`
				echo "Compose email and sent to all"
				read -p "Subject:" subject
				read -p "Message:" message
				echo -e "This is your Message:${yellow}$message${reset} \n"
				echo "$message" | mail -s "$subject" $allEmail
				echo "Email SENT to the following EMAIL ADDRESSES:"
				echo -e "${green}$allEmail ${reset}\n"
	 			;;
		
			[Nn])
				echo -e "Back to previous menu \n"
				;;
			
			*)
				echo "invalid input.. back to previous menu"
				;;
		esac
	;;

	"CHECK Email")
	mail
	echo "Exit?"
	;;

	"Back to MAIN MENU")
	clear
	./menu.sh
	exit 0
	;;

	esac
done
