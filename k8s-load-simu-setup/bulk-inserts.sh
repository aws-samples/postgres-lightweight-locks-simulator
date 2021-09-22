#!/bin/bash 

n=$NUM_OF_SINGLE_INSERTS
for ((i=1 ; i<=$n ; i++))
do
  /series-inserts.sh
  sleep `awk -v min=10 -v max=30 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
done
/series-inserts.sh
