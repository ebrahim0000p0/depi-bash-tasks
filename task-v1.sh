#! /bin/bash

checkSuccess(){

	if [[ $1 -eq 0 ]]; then
		echo -e "$2"
	else 
		echo -e "$3"
	fi
}


while true ; do
	#print menu of options
	echo -e '\nchoose the number from menu \n 1. Add User \n 2. Remove user \n 3. Update password \n 4. List All user \n 5. Exit \n'

	read -p 'Enter the number = ' number

	
	if [[ number -eq 1 ]]; then 
		# echo 'add user'
		read -p 'Enter user name ' user
		sudo useradd $user
	
		checkSuccess $? "User << $user >> added successfully\n" " please enter another username \n" 
		continue
	
	
	elif [[ number -eq 2 ]]; then 
		#echo 'remove user'
		read -p 'enter user name to remove : ' user
		sudo userdel $user

		checkSuccess $? "User << $user >> removed successfully \n" "write username correctly \n" 
		continue		
	
	
	
	elif [[ number -eq 3 ]]; then 
		#echo 'update pass'
		read -p 'enter usename to update password : ' user
		sudo passwd $user

		checkSuccess $? "" "\n $? \n" 
		continue
	
	
	
	elif [[ number -eq 4 ]]; then

		#echo 'list all user'
		userCount=$(awk -F: ' $3 >= 1000 && $3 != 65534 { print } ' /etc/passwd | wc -l)
		
		checkSuccess $? "Users Count = $userCount\n" "please try again " 
		
		#print users details
		awk -F: ' $3 >= 1000 && $3 != 65534 { print } ' /etc/passwd	
		continue
			

	elif [[ number -eq 5 ]]; then 
		break
		

	else
		echo "choose number from menu \n "
	fi
done

checkSuccess $? "hope see you soon" " wait seconds and try"
