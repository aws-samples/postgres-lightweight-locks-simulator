#!/bin/bash 
#/init.sh
n=$NUM_OF_SINGLE_INSERTS
for ((i=1 ; i<=$n ; i++))
do
  /insert-2-db-and-sqs.sh &
  sleep `awk -v min=10 -v max=30 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
  /insert-2-db-and-sqs.sh &
  sleep `awk -v min=10 -v max=30 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
done
/insert-2-db-and-sqs.sh 
