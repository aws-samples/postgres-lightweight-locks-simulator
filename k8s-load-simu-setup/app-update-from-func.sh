#!/bin/bash 

export PGPASSWORD=$DB_PASSWORD
export PGHOST=$DBHOST

while true
do
    psql -A -e -t -U postgres -w -c "begin; update orders set updated_at=NOW(),int_notnull_1=int_notnull_1+1,timestamp_null_1=NOW(),timestamp_null_2=NOW(),timestamp_null_3=NOW(),timestamp_null_4=NOW(),timestamp_null_5=NOW(),timestamp_null_6=NOW(),timestamp_null_7=NOW(),timestamp_null_8=NOW(),timestamp_null_9=NOW(),timestamp_null_10=NOW(),timestamp_null_11=NOW(),timestamp_null_12=NOW(),timestamp_null_13=NOW(),timestamp_null_14=NOW(),timestamp_null_15=NOW(),timestamp_null_16=NOW(),timestamp_null_17=NOW(),timestamp_null_18=NOW(),timestamp_null_19=NOW(),timestamp_null_20=NOW(),timestamp_null_21=NOW(),timestamp_null_22=NOW(),timestamp_null_23=NOW(),timestamp_null_24=NOW(),timestamp_null_25=NOW(),timestamp_null_26=NOW(),timestamp_null_27=NOW() where int_notnull_1<3 and created_at > NOW() - '10 minute'::INTERVAL and updated_at < NOW() - '9.9995 minute'::INTERVAL;commit;"
    sleep `awk -v min=$MIN_SLEEP_BETWEEN_UPDATES -v max=$MAX_SLEEP_BETWEEN_UPDATES 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
done
