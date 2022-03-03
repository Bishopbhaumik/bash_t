
longest=0
for word in $(<$1)
do
    len=${#word}
    if (( len > longest ))
    then
        longest=$len
        longword=$word
    fi
done

d=${#longword}
echo $d
pi=13
for word in $(<$1)
do
  lent=${#word}
  if [[ $d == $lent ]]
  then
   echo $word
  fi
done


