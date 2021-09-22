#!/bin/bash 
while true
do
# /app-update-from-func.sh &
 /app-update-from-sqs.sh &
 sleep `awk -v min=5 -v max=10 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
done
