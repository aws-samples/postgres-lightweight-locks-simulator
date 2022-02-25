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
  ret_val=`cat $sqs_file | jq '.Messages[].Body'|sed 's/"//g'`
  public_id=`echo $ret_val | awk -F\| '{print $1}'`
  created_at=`echo $ret_val | awk -F\| '{print $2}'`
  if [ -z "$public_id" ]
  then
    echo "EMPTY-SQS"
    continue
  else
    psql -A -e -t -U postgres -w -c "
begin;
/*update from sqs*/update orders set text_notnull_1=substr(md5(random()::text), 0, 25) where public_id = "$public_id" and created_at='""$created_at""';
commit;"
    echo "psql exit code="$?
    if (( $?>0 )) 
    then
      echo "ERR-DB"
      #sleep `awk -v min=10 -v max=30 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
      sleep 5
    else
      aws sqs delete-message --queue-url ${QUEUE_URL} --receipt-handle $receipt_handle
    fi
  fi
done
