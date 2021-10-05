#!/bin/bash 
#/init.sh
n=$NUM_OF_UPDATE_THREADS
for ((i=1 ; i<=$n ; i++))
do
# /app-update-from-func.sh &
 /app-update-from-sqs.sh &
 /app-update-from-sqs.sh &
 /app-update-from-sqs.sh 
 sleep `awk -v min=5 -v max=10 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
done
