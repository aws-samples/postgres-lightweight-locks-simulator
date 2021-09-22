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
update orders60 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and int_notnull_1<3 and updated_at > NOW() - '10 minute'::INTERVAL and updated_at < NOW() - '9.9995 minute'::INTERVAL;
update orders61 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and int_notnull_1<5 and updated_at > NOW() - '10 minute'::INTERVAL;
update orders62 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and created_at>NOW() - '9.9995 minute'::INTERVAL;
update orders63 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and updated_at>NOW() - '10 minute'::INTERVAL;
update orders64 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and created_at>NOW() - '9.9995 minute'::INTERVAL and idempotency_key>'"$id"';
update orders65 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and int_notnull_1<3 and updated_at > NOW() - '90 minute'::INTERVAL and updated_at < NOW() - '100 minute'::INTERVAL;
update orders66 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id in (select id from orders where id>'"$id"' limit 2);
update orders67 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id in (select id from orders where id>'"$id"' limit 2);
update orders68 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and updated_at>NOW() - '10 minute'::INTERVAL;
update orders69 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and created_at>NOW() - '9.9995 minute'::INTERVAL and idempotency_key>'"$id"';
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
