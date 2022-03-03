echo "Hello Bishop"
echo "------------------------------------------------------"
echo "Please enter your password: "
read -rs password
cr="Bishop123"
if [[ "$password" == "$cr" ]]
then
echo "login sucessfull"
else
 echo "enter correct password"
#echo "${password}"
fi
