#!/bin/bash 
#/init.sh
export PGPASSWORD=$DB_PASSWORD
export PGHOST=$DBHOST
export PGUSER=postgres

psql -P pager=off -U postgres -w -c "vacuum freeze verbose orders1;"

pgbench -i

pgbench -c $CLIENTS -T $DURATION -f /pgbench-insert.sql 
pgbench -c $CLIENTS -T $DURATION -f /pgbench-update.sql 
