# Bash-Script
#Hello, my name Eugenio Manlapaz and this is my Bash scripting assignment.

#Ive got 6 files. menu, add, search, remove, email.sh and BERdetails
and they are under my Assessment 1 directory.

First off, Im going to show you my MAIN MENU.

So I have a bit of a welcome note here and PS3 options.

I used the ANSI colours to higlight the words.

Each option links to the other files in the Directory and the EXIT option
will close the program.

ADD.SH##################################################################
#The first option on the MENU.SH is the ADD Data which is linked to my ADD.SH
file. 

The second option will move the user back to the MENU.SH options.

I used the same colour motif for all the files just to make it consistent.
on the top lines, I have my ANSI colour, header and menu variables.

I used CLEAR to keep the UI tidy.

Then I used a PS3 for my ADD.sh MENU. The first option is the ADD DATA wherein
can enter the details on the record.

I started first with the NAME which is divided into FIRST name and LAST name.
For all the READ prompts I have a WHILE loop to set conditions.

For example with the First Name. If I press ENTER without inputing anything
it will give me an ERROR and a MESSAGE about the ERROR.

The ERROR would be "INVALID INPUT... FIRST name cannot be blank or a Number.
I used a [ -z firstName and a NOT lower/upper case alphabet] to set my
CONDITIONS. 

As long as the user makes the ERROR, the loop will continue. It will EXIT 
when a CORRECT input is entered or when the USER types "quit".

Typing "quit" will clear the screen and go back to the ADD MENU. 
Entering the FIRST name correctly will push forward to the LAST name prompt.

The Last name prompt has the same pattern and conditions as the FIRST name.

The next prompt is the EIRCODE. For this I have set conditions using WHILE
loop. I used the $eircode variable not equal to 7. It will throw an ERROR 
if the USER inputs a null value or more or if the INPUT is not 7 characters.

For the PHONE input, it will throw an ERROR if a null value is entered,
if the length is not equal to 10 or if the USER inputs ALPHABETS.
I used the [:digit:].

The EMAIL inputs will throw an ERROR when a null value is entered or when
the patter for the email is not followed. I used a REGEX to set the
email pattern XXXXX@XXXX.XXX.

The BER will only take a single letter from A-E on UPPER CASE.
ERROR on null value, length not equal to ONE and if input is not A-E
on upper case. 

Lastly for the YEAR, an INVALID input will show when a null value is entered,
if the length is not 4 or when the input is not a DIGIT.

When all the DATA are entered, a summary will be displayed and a
prompt to SAVE the DATA will be asked.

The ANSWER will either be [Y] or [N] case insensitive.

Pressing [Y] will save the DATA to BERdetails based on this pattern
name- eircode- phone number- email address- BER- year.
A saved confirmation message will also be displayed.

Pressing [N] will display a "DATA not SAVED" message and will go back to 
the MAIN MENU

Pressing any other keys aside from [Y]/[N] will show an ERROR 
and DATA NOT SAVED message

SEARCH.SH#############################################################
For the SEARCH.SH, I used the same format as the ADD.SH for consistency.

I used the PS3 for the  SEARCH options menu.

The first option is the SEARCH by NAME. The USER is required to input a NAME
ERROR will be displayed when a null value is entered and if the name is a NUMBER.
Triggering the ERROR will give you the option to go back to the SEARCH menu
by typing "quit".

The user can input the first name, last name or full name. It advised to
input the FULL NAME to narrow the search.
I used a grep -i (case insensitive) $name VARIABLE BERdetails to extract the
data.

If the search if successful, it will display the NUMBER of RECORDS found
and the details of the NAME searched.
IF data not found, it will display NO RECORDS FOUND.
I used a grep -w -c $name variable BERdetails to check the number of lines
matched. This is then passed to my IF/ELIF statement.

The second option is the SEARCH BY BER. I used another PS3 and divided the 
BER ratings per A-E. Choosing the number correspoding the BER will display
the DATA. The DATA is sorted as PER BER value. I used a grep pattern match and grep
-w -c to extract the lines and display the number of records found.

The third option is the SEARCH ALL DATA which displays all the data found in
the BERdetail files including the number of lines.

BACK TO MAIN MENU moves the user back to the MENU.SH

REMOVE.SH#################################################################
The Remove.sh follows the same format as the other files.
I used PS3 for the OPTIONS.

First OPTION is the SEARCH and DELETE. 
Here, a prompt is displayed asking the 
user to input a NAME. Note that the search is Case Sensitive and a Full name 
is required to narrow the Search. To aid the user, I used the AWK print to
display the NAMES on a LIST. The user can then copy the name and input it in the prompt.
A null input will throw an ERROR. The USER can either type the NAME again or
type "quit" to exit. 
To DELETE the file, I used SED -i "/$name/d" BERdetails.

The next option is the DELETE ALL RECORDS. 
A WARNING MESSAGE will display warning the user about DELETING all RECORDS.
A prompt will ask the user if he would like to delete all records and is answerable
by [yes] or [no]. The User must type YES or NO. To delete all files I used an > BERdetails
This will empty the BERdetails file.

Back to MENU will push bak to menu.sh.

EMAIL.SH###################################################################
The Email.sh file follows the same format as the previous files.

PS3 is used to display the options

The SEND an EMAIL option shows  the names and their corresponding EMAIL ADDRESSes
using AWK print BERdetails.
The user will then type the Email address on the list. an ERROR will display if
email input is null or when the regex pattern set if not followed.
After typing the email address the user will be asked if he would like to send an
email to the email address. Using a case statement, if the user press Y a prompt
will display asking for a subject and message. Pressing ENTER on the message prompt 
will send the email. I used the "mail" to send the email. Pressing N will take the 
user back to the EMAIL menu. Pressing any other key will display an Error and  move
back to EMAIL MENU.

The SEND an EMAIL to all uses the same format as the SEND EMAIL. Instead of searching 
the specific email address, the program will send an email to all the email addesses
on the list. I used an AWK to extract all email addresses in the file.

The CHECK EMAIL option will open the MAIL inbox. Typing "quit" will exit the inbox.

BACK to MAIN MENU moves the user back to menu.sh



#################END#############################################################
14/10/22
