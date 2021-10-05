#!/bin/bash 

export PGPASSWORD=$DB_PASSWORD
export PGHOST=$DBHOST

while true
do
  id=`psql -A -q -t -U postgres -w -f insert-into-order.sql`
  echo "psql exit code="$?
  if [ -z "$id" ]
  then
    echo "ERR-DB"
  else
    aws sqs send-message --queue-url ${QUEUE_URL} --message-body "${id}" 
    echo "sqs exit code="$?
  fi
  #sleep `awk -v min=10 -v max=30 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
  sleep 3
done
