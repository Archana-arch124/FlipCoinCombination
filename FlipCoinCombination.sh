#Welcome to FlipCoin Combination Problem

#!/bin/bash

   flip=$((RANDOM%2))
   if [ $flip -eq 1 ]
   then
     echo "Heads win"
   else
      echo "Tails win"
   fi

