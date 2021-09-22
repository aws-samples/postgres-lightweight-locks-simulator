#!/bin/bash

while true
do
    i=`awk -v min=1 -v max=10 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
    #psql -A -q -t -w postgres://postgres$i:'Admin1234!'@af18acdd595674d10a50a60125624e72-8c1396ad4d584287.elb.us-west-2.amazonaws.com:5432/postgres -c "begin;SELECT * FROM orders WHERE  int_notnull_1<3 and created_at > NOW() - '2 hour'::INTERVAL and updated_at < NOW() - '1.99999 hour'::INTERVAL;commit;"
    psql -A -q -t -w postgres://postgres$i:'Admin1234!'@af18acdd595674d10a50a60125624e72-8c1396ad4d584287.elb.us-west-2.amazonaws.com:5432/postgres -f insert-into-order-many.sql
    sleep `awk -v min=5 -v max=7 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
done
