#!/bin/bash 

export PGPASSWORD=$DB_PASSWORD
export PGHOST=$DBHOST

while true
do
  id=`psql -A -q -t -U postgres -w -f insert-into-order-1.sql`
  echo "psql exit code="$?
  if [ -z "$id" ]
  then
    echo "ERR-DB"
  else
    aws sqs send-message --queue-url ${QUEUE_URL} --message-body "${id}" 
    echo "sqs exit code="$?
  fi
done
