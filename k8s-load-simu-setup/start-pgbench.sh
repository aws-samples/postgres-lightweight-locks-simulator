#!/bin/bash 
/init.sh
export PGPASSWORD=$DB_PASSWORD
export PGHOST=$DBHOST
export PGUSER=postgres

pgbench -i

pgbench -c 1000 -T 1000000 -f /pgbench-insert.sql 
pgbench -c 1000 -T 1000000 -f /pgbench-update.sql 
