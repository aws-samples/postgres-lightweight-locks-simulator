#!/bin/bash

export PGPASSWORD=$DB_PASSWORD
export PGHOST=$DBHOST

sqs_file="/tmp/"$RANDOM".json"
while true
do
  aws sqs receive-message --queue-url ${QUEUE_URL} > $sqs_file
  echo "sqs exit code="$?
  if (( $?>0 )) 
  then
    echo "ERR-SQS"
    continue
  fi
  receipt_handle=`cat $sqs_file | jq '.Messages[].ReceiptHandle'|sed 's/"//g'`
  id=`cat $sqs_file | jq '.Messages[].Body'|sed 's/"//g'`
  if [ -z "$id" ]
  then
    echo "EMPTY-SQS"
    continue
  else
    psql -A -e -t -U postgres -w -c "
begin;
update orders set text_notnull_1=substr(md5(random()::text), 0, 25) where id = "$id" ;
update orders1 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders1) for update skip locked);
commit;"
    echo "psql exit code="$?
    if (( $?>0 )) 
    then
      echo "ERR-DB"
      sleep `awk -v min=10 -v max=30 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
    else
      aws sqs delete-message --queue-url ${QUEUE_URL} --receipt-handle $receipt_handle
    fi
  fi
  sleep `awk -v min=3 -v max=5 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
done
