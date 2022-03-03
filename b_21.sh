
for filename in '/proc'/* #get the list of files
do
        while read line
         do
               echo  $line
        done<$filename
    printf "\n\n"
done


