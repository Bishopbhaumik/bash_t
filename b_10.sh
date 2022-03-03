echo "enter a file name :"
read fname   
if [ -z "$fname" ]
then
  exit
fi
# terminal =`tty`
exec < $fname
# tp= "/*"
# pt="*/"
# lp="//"
count=1
while read line
do
 echo $count.$line
 count=`expr $count + 1`
done
# exec < $terminal