#!/usr/bin/ bash
##############################################################################################################
#Name-Bishop Bhaumik Roll-1928024

#algorithm and explenation


#This program is used to delete coments from a c file.
#As we know there are two types of comment and a mutiline comment . The singel line coment is denoted by // before
#sentence and the mutliline  comment consists of /* before line starting and ending athe comment at */
#Now  we are taking the c file as input from command line  now we are reading one by one character from the file 
#here we  are checking if we get / then we are looking for * or / if / found it is singel line comment as //
#if we find * then it is starting of multiline comment. For single line comment we deletes(i.e. continue while printing)
#in termianl) the line and for multiline comment we continue to delete the (i.e ommit while printing using continue)
#lines untill we counter */ .
#otherwise we are printing what is in the file.

################################################################################################################
file=$1
id=0
ck=0
while read -rN1 c ; do
    
    if [[ $c == '"' && $id == 0 ]]
    then
     if [[ $ck == 0 ]]
      then
       ck=1
     else 
      ck=0
    fi
    fi
    if [[ $c == '/' && $id == 0 && $ck == 0 ]]; then #checking first /
        id=1
        continue
    fi

        if [[ $c == '*' && $id == 1 ]]; then #for starting of multiline comment
        id=3
        continue
    fi
     
     if [[ $c != '/' && $id == 1 ]]
     then
     id=0
     printf  "/%s" "$c"
     continue
     fi     
    if [[ $c == '/' && $id == 1 ]]; then #checking second / for singel line comment
        id=2
        continue #continue without printing
    fi


    if [[ $c == '*' && $id == 3 ]]; then
        id=4
        continue
    fi

    if [[ $c == '/' && $id == 4 ]]; then  #ending of multiline comment
        id=0  
        continue
    fi #cloasing  if else block

    if [[ $c == $'\n' && $id == 2 ]]; then #if encounters new line
        id=0
        printf '\n'
        continue
    fi

    if [[ $id == 0 || $id == 1 ]]; then
        
        printf "%s" "$c" #actual printing process in terminal
    fi
done < $file  #loop end