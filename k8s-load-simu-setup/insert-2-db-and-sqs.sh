#!/bin/bash 

while true
do
  id=`psql -A -q -t -w -f insert-into-order-small.sql`
  echo "psql exit code="$?
  if [ -z "$id" ]
  then
    echo "ERR-DB"
  else
    aws sqs send-message --queue-url ${QUEUE_URL} --message-body "${id}" 
    echo "sqs exit code="$?
  fi
  #sleep `awk -v min=10 -v max=30 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
  sleep 10
done
