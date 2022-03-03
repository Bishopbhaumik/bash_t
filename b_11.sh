#!/bin/bash
#####################################################################################
# Name -Bishop Bhaumik Roll-1928024
##algorithm and explanation


#Here we are taking the file from the command line argument thorugh $1 and checking the extention of the file
#wghether it is .txt file or .morse file .If it is txt file then we are assigning id=1 if it is morse then
#we are assigning id =2 then using switch case we are using case 1 (i.e case $id) to transform the txt ot morse 
#and case 2 (i.e case $ id ) morse to text and printing the file . 
#in text to morse we are extracting one by one charecter from the file and converting it to respective morse
#through associative array named morse. after every letter putting (/) and after every word putting(//).

#In morse to text we are using the same way of using associative array named letter and converting the morse 
#code letter by letter . and printing the text in terminal


#####################################################################################
    declare -A morse     #Declaring the associative array morse 
    morse[A]=".-";
    morse[B]="-...";
    morse[C]="-.-.";
    morse[D]="-..";
    morse[E]=".";
    morse[F]="..-.";
    morse[G]="--.";
    morse[H]="....";
    morse[I]="..";
    morse[J]=".---";
    morse[K]="-.-";
    morse[L]=".-..";
    morse[M]="--";
    morse[N]="-.";
    morse[O]="---";
    morse[P]=".--.";
    morse[Q]="--.-";
    morse[R]=".-.";
    morse[S]="...";
    morse[T]="-";
    morse[U]="..-";
    morse[V]="...-";
    morse[W]=".--";
    morse[X]="-..-";
    morse[Y]="-.--";
    morse[Z]="--..";
    morse[1]=".----";
    morse[2]="..---";
    morse[3]="...--";
    morse[4]="....-";
    morse[5]=".....";
    morse[6]="-....";
    morse[7]="--...";
    morse[8]="---..";
    morse[9]="----.";
    morse[0]="-----";   
    morse[.]='.-.-.-'
    morse[,]='--..--'
    morse[?]='..--..'
    morse[=]='-...-'
# morse[.]='/'
##########################################################################
declare -A letter   #declaring the associative array letter
letter[.-]='A'
letter[-...]='B'
letter[-.-.]='C'
letter[-..]='D'
letter[.]='E'
letter[..-.]='F'
letter[--.]="G"
letter[....]="H"
letter[..]="I"
letter[.---]="J"
letter[-.-]="K"
letter[.-..]="L"
letter[--]="M"
letter[-.]="N"
letter[---]="O"
letter[.--.]="P"
letter[--.-]="Q"
letter[.-.]="R"
letter[...]="S"
letter[-]="T"
letter[..-]="U"
letter[...-]="V"
letter[.--]="W"
letter[-..-]="X"
letter[-.--]="Y"
letter[--..]="Z"
letter[-----]="0"
letter[.----]="1"
letter[..---]="2"
letter[...--]="3"
letter[....-]="4"
letter[.....]="5"
letter[-....]="6"
letter[--...]="7"
letter[---..]="8"
letter[----.]="9"
letter[.-.-.-]="."
letter[--..--]=","
letter[..--..]="?"
letter[-...-]="="
################################################################################



echo "entered file: $1"  #taking comand line argument
fullfilename=$1
 filename=$(basename "$fullfilename")
ext="${filename##*.}"   # saving extention of the file 
# echo $ext
if [[  "$ext" == "txt" ]]     #checking file extention
then
d=1      #txt file
elif [[ "$ext" == "morse" ]]
then
d=2    #morse file
else 
echo "wrong file"
fi
count=1
case "${d}" in
    1)
       echo "#################################### Text to morse converter #######################################"
       file=$1
       while read -N1 c; do    #extracting character by character from file
	       c=${c^}    #making it capital case
	      if [[ $c == $'\n' ]]; then  #if new line
		       printf '%s/'
		       printf '\n'
	      elif [[ $c == ' ' ]]; then  #if space
		       printf '//'
	      else
		      printf '%s/'"${morse[$c]}"  #convirting through morse associative array
	      fi
       done < $file
      printf '%s/'
    ;;
    2)
        echo "############################ Morse to text converter #################################"
        file=$1
        s=''
        id=0
        while read -rN1 c ; do
           if [[ $c == $'\n' ]]; then  #if new line
             printf '\n'
           fi
           if [[ $c == '/' ]]; then  #if it counters /
            if [[ $id == 0 ]]; then  #if id=0
             if [[ $s != '' ]]; then  #if it is not space
                printf '%s'"${letter[$s]}"  #convirting though letter associative array and printing
                s=''
            fi
          else
            printf ' '
        fi
        id=1        
        else
           s+="$c"  #storing the value from the file in a varriable
           id=0
        fi
        done < $file
    ;;
    *)
        exit
    ;;
esac # switch case end