#!/bin/bash
#Name-Bishop Bhaumik Roll-1928024
##################################################################################################
#Algorithm

# This is the program to get the longest word of the program In this case we are taking a varriable of lenth 0
# and  a word  varriable to store the word  and here file varriable will take the command line argument 
# now we are reading the file charecter by charecter and if we encounterd with a space or comma or the new line 
# escape sequence then we are comparing it to the maxlenth varriable if lenth varriable is grater than maxlenth varriable
# and make the lenth varriable 0 and word to empty string to reset it else we are concating charecter by charecter 
# and increasing length of the lenth varriable  at the end we will get those words which are longest word 

###################################################################################################
lenth=0
maxlenth=0
longword=''
file=$1
while read -rN1 c ; do
    if [[ $c == ' ' || $c == ',' || $c == $'\n' ]]; then #checking the word end
        if [ $lenth -gt $maxlenth ]; then
            maxlenth=$lenth     #comparing length
        fi
        lenth=0     #resetting
        longword=''
    else
        longword+="$c"    #concating word
        ((lenth+=1))      #increasing length
    fi
done < $file

if [ $lenth -gt $maxlenth ]; then
    maxlenth=$lenth
fi

while read -rN1 c ; do
    if [[ $c == ' ' || $c == ',' || $c == $'\n' ]]; then
        if [ $lenth -eq $maxlenth ]; then
            echo $longword
        fi
        lenth=0
        longword=''
    else
        longword+="$c"
        ((lenth+=1))
    fi
done < $file
if [ $lenth -eq $maxlenth ]; then
    echo $longword
fi