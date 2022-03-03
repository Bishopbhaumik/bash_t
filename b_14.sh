#!/bin/bash
check()
{
value=$1
case $value in
"-----")          echo "0";;
".----")        echo "1";;
"..---")        echo "2";;
"...--")        echo "3";;
"....-")        echo "4";;
".....")        echo "5";;
"-....")        echo "6";;
"--...")        echo "7";;
"---..")        echo "8";;
"----.")        echo "9";;
".-")              echo "A";;
"-...")          echo "B";;
"-.-.")          echo "C";;
"-..")            echo "D";;
".")                echo "E";;
"..-.")          echo "F";;
"--.")            echo "G";;
"....")          echo "H";;
"..")              echo "I";;
".---")          echo "J";;
"-.-")            echo "K";;
".-..")          echo "L";;
"--")              echo "M";;
"-.")              echo "N";;
"---")            echo "O";;
".--.")          echo "P";;
"--.-")          echo "Q";;
".-.")            echo "R";;
"...")            echo "S";;
"-")                echo "T";;
"..-")            echo "U";;
"...-")          echo "V";;
".--")            echo "W";;
"-..-")          echo "X";;
"-.--")          echo "Y";;
"--..")          echo "Z";;
".-.-.-")           echo ".";;
"--..--")           echo ",";;
"..--..")           echo "?";;
"-...-")            echo "=";;
*)                  echo "";;
esac
}
while read -rN1 f;
 do
	f=${f^}
	if [[ $f == '\n' ]]
	then
		printf '\n'
        break
	elif [[ $f != ' ' ]]
	then
        p+="${f}"
		check "$p"
	else
		printf ''
	fi
done <st.txt