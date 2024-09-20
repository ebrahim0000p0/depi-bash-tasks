#! /bin/bash
username=' '
useremail=' '
userid=' '
counter=2
userNumbers=$(cat user.txt| wc -l)

while [ $counter -le $userNumbers ];do

#this equal to NR that is built in var in awk determine a specific line
#head -n 2 user.txt | tail 
username=$(awk -F',' 'NR == '$counter' { print $1 }' user.txt)
useremail=$(awk -F',' 'NR == '$counter'  { print $2 }' user.txt)
userid=$(awk -F',' 'NR == '$counter' { print $3 }' user.txt)

#test is user id valid (not characters)
if ! [[ $userid =~ ^[0-9]+$ ]]; then
    echo -e "Warning: User $username has an invalid User ID"
    read
    exit 1
fi

#main logic
if [[ $useremail == ' ' ]] || [[ $useremail == '' ]];then
echo -e "Warning: User $username has an empty email"

elif [[ $userid == ' ' ]] || [[ $userid == '' ]];then
echo -e "Warning: User $username has an empty User ID"

elif [[ $((userid % 2)) == 0 ]];then
echo -e "the $userid of $useremail is even number "

else
echo -e "the $userid of $useremail is odd number "
fi

((counter++))
done

read
