
# The given project is to take a text file as input and display
# its morse code and vice versa. 


# SOLUTION METHOD FOLLOWED

# According to our given problem statement we have initialised the morse and character
# values of each. Then we are taking a command line input and we are extracting the 
# extension of the file. If the extention is .txt then we perform the text to morse 
# conversion and if the extension is .morse then morse code to text conversion is done.


# TEXT TO MORSE ALGORITHM

# If the extension of the entered file is .txt then we will get right into conversion 
# to the morse code for the same. We will read each character from the file one by one.
# If the character read is found to be '\n' or next line operator then we also move to a
# new line in the display promt. If the character is a valid character then we print the
# respective morse value for it followed by a '/'. If the character is a blankspace ' '
# then we print a '/'. So the output comes is such a way that each letter of a word is 
# separated by a '/' and each word is separated by a '//'.


# MORSE TO TEST ALGORITHM

# If the extension of the entered file is .morse then we will get right into conversion 
# to the text for the same. We will read each character from the file one by one.
# If the character read is found to be '\n' or next line operator then we also move to a
# new line in the display promt. We have taken a string variable <word> in which we will 
# store the read characters until we find a '/'. When a '/' is found then we will print the
# <word> variable and again make it null and <flag> is made to 1. If we again find a '/' and
# the <flag> is 1 then we will print a blankspace and make <flag> to 0.



# Here I have predefined the alphabets and certain characters
# with their respective morse code values.


declare -A morse
morse[A]=".-";
morse[B]="-...";
morse[C]="-.-.";
morse[D]="-..";
morse[E]="."
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
morse[.]='.-.-.-';
morse[,]='--..--';
morse[?]='..--..';
morse[=]='-...-';



# Here I have predefined the morse code values 
# with their respective alphabet and characters.


declare -A alpha
alpha[.-]="A"
alpha[-...]="B"
alpha[-.-.]="C"
alpha[-..]="D"
alpha[.]="E"
alpha[..-.]="F"
alpha[--.]="G"
alpha[....]="H"
alpha[..]="I"
alpha[.---]="J"
alpha[-.-]="K"
alpha[.-..]="L"
alpha[--]="M"
alpha[-.]="N"
alpha[---]="O"
alpha[.--.]="P"
alpha[--.-]="Q"
alpha[.-.]="R"
alpha[...]="S"
alpha[-]="T"
alpha[..-]="U"
alpha[...-]="V"
alpha[.--]="W"
alpha[-..-]="X"
alpha[-.--]="Y"
alpha[--..]="Z"
alpha[-----]="0"
alpha[.----]="1"
alpha[..---]="2"
alpha[...--]="3"
alpha[....-]="4"
alpha[.....]="5"
alpha[-....]="6"
alpha[--...]="7"
alpha[---..]="8"
alpha[----.]="9"
alpha[.-.-.-]="."
alpha[--..--]=","
alpha[..--..]="?"
alpha[-...-]="="



# Here we have extracted the file extention of the
# file we have received from command line input.
# The file extention is stored in <ext> variable.

# Variables Used
# file - to store the file received
# name - to store the name of the file
# ext  - to store the extension of the file


printf '\n'
echo "File Received : $1"
printf '\n'
file=$1
name=$(basename "$file")
ext="${name##*.}"



# Here we will compare the extracted file extension stored
# in <ext> and the proceed to do the particular conversion
# We will give out a error msg if any file extension otherthan .txt or .morse is received 

# Variables Used
# f - to store the file to work on
# x - to store each character read from the file
# word - to store the morse code till a valid character is matched
# flag - i have used this variable to help differentiate between the gap
#        between and letters and gap between words.


f=$1
if [[ $ext == "txt" ]]; then # convert text to morse code
# TEXT TO MORSE ALGORITHM

# If the extension of the entered file is .txt then we will get right into conversion 
# to the morse code for the same. We will read each character from the file one by one.
# If the character read is found to be '\n' or next line operator then we also move to a
# new line in the display promt. If the character is a valid character then we print the
# respective morse value for it followed by a '/'. If the character is a blankspace ' '
# then we print a '/'. So the output comes is such a way that each letter of a word is 
# separated by a '/' and each word is separated by a '//'.
    printf "TEXT TO MORSE CONVERTER"
    printf '\n\n'
    while read -N1 x; do
	    x=${x^}
	    if [[ $x == $'\n' ]]; then
		    printf '%s/'
		    printf '\n'
	    elif [[ $x == ' ' ]]; then
		    printf "/"
	    else
		    printf '%s/'"${morse[$x]}"
	    fi
    done < $f
    printf '%s/'
elif [[ $ext == "morse" ]]; then # convert morse code to text
# MORSE TO TEST ALGORITHM

# If the extension of the entered file is .morse then we will get right into conversion 
# to the text for the same. We will read each character from the file one by one.
# If the character read is found to be '\n' or next line operator then we also move to a
# new line in the display promt. We have taken a string variable <word> in which we will 
# store the read characters until we find a '/'. When a '/' is found then we will print the
# <word> variable and again make it null and <flag> is made to 1. If we again find a '/' and
# the <flag> is 1 then we will print a blankspace and make <flag> to 0.
    printf "MORSE TO TEXT CONVERTER"
    printf '\n\n'
    word=''
    flag=0
    while read -N1 x ; do
        if [[ $x == $'\n' ]]; then
            printf '\n'
        fi
        if [[ $x == '/' ]]; then
            if [[ $flag == 0 && $word != '' ]]; then
                printf '%s'"${alpha[$word]}"
                word=''
            elif [[ $flag != 0 ]]; then
                printf ' '
            fi
            flag=1
        else
            word+="$x"
            flag=0
        fi
    done < $f
else    # if the extension is not supported then an error msg is displayed
    echo "Entered file type not supported...!!!"
fi
printf '\n'