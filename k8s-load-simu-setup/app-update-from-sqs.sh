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
update orders1 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders1) for update skip locked);
update orders2 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders2) for update skip locked);
update orders3 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders3) for update skip locked);
update orders4 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders4) for update skip locked);
update orders5 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders5) for update skip locked);
update orders6 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders6) for update skip locked);
update orders7 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders7) for update skip locked);
update orders8 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders8) for update skip locked);
update orders9 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders9) for update skip locked);
update orders10 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders10) for update skip locked);
update orders11 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders11) for update skip locked);
update orders12 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders12) for update skip locked);
update orders13 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders13) for update skip locked);
update orders14 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders14) for update skip locked);
update orders15 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders15) for update skip locked);
update orders16 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders16) for update skip locked);
update orders17 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders17) for update skip locked);
update orders18 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders18) for update skip locked);
update orders19 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders19) for update skip locked);
update orders20 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders20) for update skip locked);
update orders21 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders21) for update skip locked);
update orders22 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders22) for update skip locked);
update orders23 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders23) for update skip locked);
update orders24 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders24) for update skip locked);
update orders25 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders25) for update skip locked);
update orders26 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders26) for update skip locked);
update orders27 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders27) for update skip locked);
update orders28 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders28) for update skip locked);
update orders29 set text_notnull_1=substr(md5(random()::text), 0, 25) where id = (select id from orders where id = (select floor(random() * max(id) + 1)::bigint from orders29) for update skip locked);
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
