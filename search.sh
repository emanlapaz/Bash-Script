##!/bin/bash
#Author: Eugenio Manlapaz 
#Student Number 20100113
#Script Description : Search Script

# You can search using name, eircode or phone number.
# You can view all data


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
menu=`echo -e "${yellow}SEARCH MENU: choose from the OPTIONS and press ENTER: ${reset}"`

echo -e "$header \n"
echo "SELECT OPTIONS:"
PS3="$menu"
echo "$space"
options=("SEARCH by Name" "SEARCH by BER" "SEARCH all Data" "Back to Main Menu")
select opt in "${options[@]}"
do
	case $opt in
	"SEARCH by Name")
	clear
	echo "$space"
	echo -e "${yellow}SEARCH by NAME: ${reset} \n"
	read -p  "Type the NAME to search: " name
	while [[ -z "$name" || ! "$name" =~ [:alpha:] ]]
	do
		clear
		echo -e "ERROR \n"
		echo -e "${red}Invalid input... NAME cannot be blank or a number. ${reset} \n"
		echo -e "Please enter ${green} NAME ${reset} to ${yellow}SEARCH${reset} or type ${yellow}quit${reset} to go back to ${yellow}PREVIOUS MENU: ${reset} \n"
		echo -e "${yellow}SEARCH by NAME: ${reset} \n"
		read -p "Type the NAME : " name	
		if [ $name == "quit" ]
		then
			clear
			./search.sh
			exit 1
		fi 
	done

	clear
	record=`grep -i "$name" BERdetails`
	found=`grep  -w -c "$name" BERdetails`

	echo -e "Here are the ${yellow}SEARCH ${reset}results: \n"
	if [ $found -ge 1 ]
	then
		echo -e "RECORDS found: $found \n"
		echo "$space"
		echo -e "${yellow}$record{reset} \n"
		echo "$space"
		echo -e "END OF SEARCH \n"

	elif [ "$found" -eq 0 ]
	then
		echo -e "No ${yellow}RECORDS${reset} found. \n"
		echo -e "Back to ${yellow} PREVIOUS MENU ${reset} \n"
	fi
	echo "$header"
	;;

	"SEARCH by BER")
	clear

	BERrecordA=`grep "BER:A" BERdetails`
	BERrecordB=`grep "BER:B" BERdetails`
	BERrecordC=`grep "BER:C" BERdetails`
	BERrecordD=`grep "BER:D" BERdetails`
	BERrecordE=`grep "BER:E" BERdetails`

	berA=`grep -w -c "BER:A" BERdetails`
	berB=`grep -w -c "BER:B" BERdetails`
	berC=`grep -w -c "BER:C" BERdetails`
	berD=`grep -w -c "BER:D" BERdetails`
	berE=`grep -w -c "BER:E" BERdetails`

	echo "$header"
	echo -e "SEARCH record based on the Building Energy Rating ${reset} \n"
	PS3="Choose an OPTION (1-5): "
	options=("search BER: A" "search BER: B" "search BER: C" "search BER: D" "search BER: E" "Back to Previous Menu")
	select opt in "${options[@]}"
	do
		case $opt in
			"search BER: A")
				clear
				if [ $berA -ge 1 ]
				then
	                       		echo -e "RECORD found: $berA \n"
					echo "$space"
					echo -e "${yellow}$BERrecordA${reset} \n"
					echo "$space"
					echo -e "END OF SEARCH \n"

				elif [ $berA -eq 0 ]
				then
					echo -e "No ${yellow}RECORDS${reset} found. \n"
					echo -e "Back to ${yellow} PREVIOUS MENU${reset} \n"
				fi
				echo "$header"
				;;
				
			"search BER: B")
				clear   
                                if [ $berB -ge 1 ]
                                then    
                                        echo -e "RECORD found: $berB \n"
                                        echo "$space"
                                        echo -e "${yellow}$BERrecordB${reset} \n"
                                        echo "$space"
                                        echo -e "END OF SEARCH \n"

                                elif [ $berB -eq 0 ]
                                then    
                                        echo -e "No ${yellow}RECORDS${reset} found. \n"
                                        echo -e "Back to ${yellow} PREVIOUS MENU${reset} \n"
                                fi
                                echo "$header"
                                ;;

			"search BER: C")
				clear   
                                if [ $berC -ge 1 ]
                                then    
                                        echo -e "RECORD found: $berC \n"
                                        echo "$space"
                                        echo -e "${yellow}$BERrecordC${reset} \n"
                                        echo "$space"
                                        echo -e "END OF SEARCH \n"

                                elif [ $berC -eq 0 ]
                                then    
                                        echo -e "No ${yellow}RECORDS${reset} found. \n"
                                        echo -e "Back to ${yellow} PREVIOUS MENU${reset} \n"
                                fi
                                echo "$header"
                                ;;

			"search BER: D")
				clear   
                                if [ $berD -ge 1 ]
                                then    
                                        echo -e "RECORD found: $berD \n"
                                        echo "$space"
                                        echo -e "${yellow}$BERrecordD${reset} \n"
                                        echo "$space"
                                        echo -e "END OF SEARCH \n"

                                elif [ $berD -eq 0 ]
                                then    
                                        echo -e "No ${yellow}RECORDS${reset} found. \n"
                                        echo -e "Back to ${yellow} PREVIOUS MENU${reset} \n"
                                fi
                                echo "$header"
                                ;;

			"search BER: E")
				clear   
                                if [ $berE -ge 1 ]
                                then    
                                        echo -e "RECORD found: $berE \n"
                                        echo "$space"
                                        echo -e "${yellow}$BERrecordE${reset} \n"
                                        echo "$space"
                                        echo -e "END OF SEARCH \n"

                                elif [ $berE -eq 0 ]
                                then    
                                        echo -e "No ${yellow}RECORDS${reset} found. \n"
                                        echo -e "Back to ${yellow} PREVIOUS MENU${reset} \n"
                                fi
                                echo "$header"
                                ;;

			"Back to Previous Menu")
				clear
				./search.sh
				exit 0
				;;
			*)
				echo "Invalid input... Please choose an ${yellow}OPTION{reset}"
				;;
		esac
	done
	;;

	"SEARCH all Data")
	clear
	echo "$header"
	all=`wc -l < BERdetails`
	if [ $all -gt 0 ]
	then
		echo "These are the RECORDS saved: "
		echo -e "${yellow}RECORDS FOUND: $all ${reset} \n"
		allRecords=`cat BERdetails`
		echo -e "${green}$allRecords${reset}"
		echo "END OF RECORD"

	elif [ $all -eq 0 ]
	then 
		echo -e " ${yellow}No RECORDS found ${reset}"
	fi
	;;

	"Back to Main Menu")
	clear
	./menu.sh
	exit 0
	;;

esac
done
