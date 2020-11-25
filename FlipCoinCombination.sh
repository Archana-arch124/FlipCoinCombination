#!/bin/bash

echo -p "Enter the number of times to flip coin:"
read  number
echo -p "How many coins:"
read coins
declare -A dictionary

function coin(){
for ((i=1;i<=number;i++))
do
for ((i=0;i<=coins;j++))
do
   random=$((RANDOM%2))
    if [ $random -eq 0 ]
    then
      val=$val"H"
       echo "Head Win"
    else
      val=$val"T"
       echo "Tail Win"
    fi
done
done
}
coin "flipped possibilities"

