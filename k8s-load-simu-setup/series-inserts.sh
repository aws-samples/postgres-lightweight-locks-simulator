#!/bin/bash 
export PGPASSWORD=$DB_PASSWORD
export PGHOST=$DBHOST

while true
do
  psql -A -t -U postgres -w -f insert-into-order-series.sql
  echo "psql exit code="$?
done
