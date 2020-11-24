#Welcome to FlipCoin Combination Problem

#!/bin/bash
declare -A doublet

headheadwon=0
headtailwon=0
tailheadwon=0
tailtailwon=0
#we take HH=11,TT=11,TH=01,HT=10
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

for ((i=1;i<=$number;i++))
do
   flip=$(((RANDOM%2)*10+($RANDOM%2)))
   if [ $flip -eq 11 ]
   then
       doublet[$i]="HH"
       ((headheadwon++))
      elif [ $flip -eq 10 ]
      then
       doublet[$i]="HT"
       ((headtaiwon++))
      elif [ $flip -eq 01 ]
      then
       doublet[$i]="TH"
       ((tailheadwon++))
      else
       doublet[$i]="TT"
       ((tailtailwon++))
    fi
done

echo "   DOUBLET SIMULATIONS       "
echo "Simulation results are :"${doublet[@]}
echo "Doublet HeadHead win percentage :"
echo $headheadwon $number | awk '{print 100*$1/$2}'
echo "Doublet HeadTail win percentage :"
echo $headtailwon $number | awk '{print 100*$1/$2}'
echo "Doublet TailHead win percentage :"
echo $tailheadwon $number | awk '{print 100*$1/$2}'
echo "Doublet TailTail win percentage :"
echo $tailtailwon $number | awk '{print 100*$1/$2}'

doubletresult=($headheadwon $headtailwon $tailheadwon $tailtailwon )
doubletval=("HH" "HT" "TH" "TT")
val=$(maxout "${doubletresult[@]}")
echo "Winning combinations are ${doubletval[$val]}"

