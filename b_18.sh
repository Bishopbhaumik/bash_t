declare -A letter
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

file=sp.morse
s=''
id=0
while read -rN1 c ; do
    if [[ $c == $'\n' ]]; then
        printf '\n'
    fi
    if [[ $c == '/' ]]; then
        if [[ $id == 0 && $s != '' ]]; then
            printf '%s'"${letter[$s]}"
            s=''
        else
            printf ' '
        fi
        id=1
    else
        s+="$c"
        id=0
    fi
done < $file