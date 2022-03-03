ls /proc > pid.txt 
grep -E '^[0-9]' pid.txt > output.txt

#getting the pids

while read -r line
do
pi_d=$line
parpid=$(awk '/PPid:/{print $2}' /proc/$pi_d/status)
printf ""PPID:" $parpid "PID:" $pi_d \n" 
done < output.txt > ppp.txt

#printing
# for par_id in $(echo "PID:" | grep -o -E "[0-9]+" ppp.txt )
# do
# echo $par_id
# ps -p $par_id -o comm=

#    for ch_id in $(echo "PPID:" | grep -o -E "[0-9]+" ppp.txt )
#    do
# # # if [[ $ch_id == $par_id ]]
# # # then
#    done
# # # fi
# done
co=0
for par_id in $(echo "PID:" | grep -o -E "[0-9]+" ppp.txt )
do
    k=$par_id
    printf "$par_id"
    # ps -p $i -o comm=
    for ch_id in $(echo "PPID:" | grep -o -E "[0-9]+" ppp.txt ); do  for pi_l in $(echo "PID:" | grep -o -E "[0-9]+" ppp.txt );do
    # do 
    #    if [[ $ch_id == $k ]]
    #    then
    #     ((co++))
    #     printf "\t"
    #     printf "$pi_d"     
    #     k=$ch_id
    #     fi
    #     if [[ $co == 0 ]] 
    #     then  
    #     k=$par_id
    #     co=0
    #     fi    
    # printf " "PID :" $pi_d  "PPID:" $ch_id "
    # printf ""PPID:" $ch_id "PID:" $pi_l \n"
    echo $ch_id $pi_l
    done; done
done


# for i in ; do for j in $(echo "PID:" | grep -o -E "[0-9]+" ppp.txt )  $(echo "PPID:" | grep -o -E "[0-9]+" ppp.txt ); do echo $i $j; done; done
