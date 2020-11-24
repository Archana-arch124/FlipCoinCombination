#Welcome to FlipCoin Combination Problem

#!/bin/bash

function maxout(){
    arr=("$@")
    max=0
    for i in ${!arr[@]}
    do
      if [ ${arr[$i]} -gt ${arr[$max]} ]
      then
           max=$i
       fi
    done
    echo $max
}

read -p "Enter number of flips:" number
declare -A singlet
headwon=0
tailwon=0

for ((i=1;i<=$number;i++))
do
   flip=$((RANDOM%2))
   singlet[$i]=$flip
   if [ $flip -eq 0 ]
   then
       ((tailwon++))
   else
       ((headwon++))
    fi
done

echo "   SINGLET SIMULATIONS       "
echo "Simulation results are :"${singlet[@]}
echo "Singlet Head win percentage :"
echo $headwon $number | awk '{print 100*$1/$2}'
echo "Singlet Tail win percentage :"
echo $tailwon $number | awk '{print 100*$1/$2}'

singletresult=($headwon $tailwon)
singletval=("H" "T")
val=$(maxout "${singletresult[@]}")
echo "Winning combinations are ${singletval[$val]}"


