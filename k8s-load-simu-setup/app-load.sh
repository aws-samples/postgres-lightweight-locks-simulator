#!/bin/bash

export PGPASSWORD=$DB_PASSWORD
export PGHOST=$DBHOST
export PGUSER=$DB_USER

while true
do
  sleep `awk -v min=10 -v max=30 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
  id=`psql -A -q -t -w -c "begin;select count(*),int_notnull_2/1000,int_notnull_3/1000 from orders WHERE  created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() - '7 minute'::INTERVAL  group by int_notnull_2/1000,int_notnull_3/1000;"`
  echo "psql exit code="$?
  if [ -z "$id" ]
  then
    echo "ERR-DB"
  fi
  sleep `awk -v min=10 -v max=30 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
done
