#Welcome to FlipCoin Combination Problem

#!/bin/bash
read -p "Enter number of flips:" number
declare -A triplet
headheadheadwon=0
headheadtailwon=0
headtailheadwon=0
headtailtailwon=0
tailtailtailwon=0
tailheadtailwon=0
tailtailheadwon=0
tailheadheadwon=0


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
   flip=$((($RANDOM%2)*100+($RANDOM%2)*10+($RANDOM%2)))
   case $flip in
      0)
           triplet[$i]="TTT"
           ((tailtailtailwon++))
            ;;
      1)
           triplet[$i]="TTH"
           ((tailtailheadwon++))
            ;;
      10)
           triplet[$i]="THT"
           ((tailheadtailwon++))
           ;;
     11)
           triplet[$i]="THH"
           ((tailheadheadwon++))
            ;;
      100)
           triplet[$i]="HTT"
           ((headtailtailwon++))
           ;;
      110)
           triplet[$i]="HHT"
           ((headheadtailwon++))
            ;;
       *)
           triplet[$i]="HHH"
           ((headheadheadwon++))
            ;;
   esac
done

echo "   TRIPLET SIMULATIONS       "
echo "Simulation results are :"${triplet[@]}
echo "Triplet HeadHeadHead win percentage :"
echo $headheadheadwon $number | awk '{print 100*$1/$2}'
echo "Triplet HeadHeadTail win percentage :"
echo $headheadtailwon $number | awk '{print 100*$1/$2}'
echo "Triplet TailTailHead win percentage :"
echo $tailtailheadwon $number | awk '{print 100*$1/$2}'
echo "Singlet HeadTailHead win percentage :"
echo $headtailheadwon $number | awk '{print 100*$1/$2}'
echo "Triplet TailHeadTail win percentage :"
echo $tailheadtailwon $number | awk '{print 100*$1/$2}'
echo "Triplet TailTailTail win percentage :"
echo $tailtailtailwon $number | awk '{print 100*$1/$2}'

tripletresult=($headheadheadwon $headheadtailwon $tailtailheadwon $tailtailtailwon $headtailheadwon $tailheadtailwon)
tripletval=("HHT" "HTH" "TTH" "HTT" "THT" "TTT")
val=$(maxout "${tripletresult[@]}")
echo "Winning combinations are ${tripletval[$val]}"

