declare -A morse     
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


echo "entered file :$1"
exec < $1
while read  line 
do
for ij in $line
do
for (( i=0; i<${#ij}; i++ )); do
 tp=${ij:$i:1}
 tp=${tp^}
#  echo $tp
  echo "${morse[$tp]}"
done
done
done