#!/bin/bash -x
export PGUSER=postgres
export PGPASSWORD=$DB_PASSWORD
bucket=$BUCKET
dbid=$DBID
dblist=$SA_SNAPPER_DB_LIST
interval=$SA_SNAPPER_INT
numofsnapshots=$SA_SNAPPER_NO_SNAPSHOT

#while true
#do
  /snapper_rds -i $dbid --sa-snapper-database-list $dblist --sa-snapper-snapshots-interval $interval --sa-snapper-no-snapshots $numofsnapshots
  reports=`find / -name "$DBID*.html"`
  for report in $reports
  do
    echo $report
    aws s3 cp $report s3://$bucket/ 
  done
#  sleep 70
#done
