#!/bin/bash 
#/init.sh
export PGPASSWORD=$DB_PASSWORD
export PGHOST=$DBHOST
export PGUSER=postgres

pgbench -i

pgbench -c $CLIENTS -T $DURATION -f /pgbench-insert.sql 
pgbench -c $CLIENTS -T $DURATION -f /pgbench-update.sql 
