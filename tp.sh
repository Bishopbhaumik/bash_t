file=tek.c  #filename
id=0
while read -r -N1 c    #using loop to read from file
do
    if [[ $c == '/' && $id == 0 ]]      #checking for / for single or multiline comment
    then
    id=1
    d=$c
    continue
    # continue    #skip to the next part  
    elif [[ $c == '/' && $id == 5 ]]
    then
    id=2
    fi

    if [[ $c == $'"' ]]
    then
       id=5
    
    fi
    
    if [[ $c == $'"' && $id == 5 ]]
    then
    id=0
    fi



    if [[ $c == '/' && $id == 1 && $d == '/' ]]       #checking for single comments
    then
    id=2
    continue
    fi

    if [[ $c == '*' && $id == 1 ]]         #checking for multi line comments 
    then
    id=3
    continue
    fi

    if [[ $c == '*' && $id == 3 ]]          #checking for end of multi line comments
    then
    id=4
    continue
    fi

    if [[ $c == '/' && $id == 4 ]]          #checking for end of multi line comments
    then
    id=0
    continue
    fi
    
    # if [[ $c != '\n' && $id == 2  ]]
    # then
    # id=0
    # # continue
    # fi



    if [[ $c == $'\n' && $id == 2 ]]        #checking for next lines
    then
    id=0
    printf '\n'
    continue
    fi

    if [[ $id == 0 || $id == 5 ]]       
    then
    printf "%s" "$c"        #printing process of the file
    fi
done < $file