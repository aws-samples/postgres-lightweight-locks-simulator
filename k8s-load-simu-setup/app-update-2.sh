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
update orders16 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"';
update orders17 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"';
update orders18 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"';
update orders19 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"';
update orders20 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and int_notnull_1<3 and updated_at > NOW() - '10 minute'::INTERVAL and updated_at < NOW() - '9.9995 minute'::INTERVAL;
update orders21 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and int_notnull_1<3 and updated_at > NOW() - '10 minute'::INTERVAL and updated_at < NOW() - '9.9995 minute'::INTERVAL;
update orders22 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and int_notnull_1<5 and updated_at > NOW() - '10 minute'::INTERVAL;
update orders23 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and created_at>NOW() - '9.9995 minute'::INTERVAL;
update orders24 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and updated_at>NOW() - '10 minute'::INTERVAL;
update orders25 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and created_at>NOW() - '9.9995 minute'::INTERVAL and idempotency_key>'"$id"';
update orders26 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"';
update orders27 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"';
update orders28 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"';
update orders29 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"';
update orders set int_notnull_1=int_notnull_2+1,updated_at=NOW() where id='"$id"';
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
