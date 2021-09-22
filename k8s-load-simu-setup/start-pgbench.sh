#!/bin/bash 

export PGPASSWORD=$DB_PASSWORD
export PGHOST=$DBHOST
export PGUSER=postgres

pgbench -i

pgbench -c 1000 -T 1000000 -f /pgbench-insert.sql 
pgbench -c 1000 -T 1000000 -f /pgbench-update.sql 

#pgbench -c 1000 -T 1000000 -f /pgbench-insert-1.sql 
#pgbench -c 1000 -T 1000000 -f /pgbench-update-1.sql 

#pgbench -c 1000 -T 1000000 -f /pgbench-insert-2.sql 
#pgbench -c 1000 -T 1000000 -f /pgbench-update-2.sql 

#pgbench -c 1000 -T 1000000 -f /pgbench-insert-3.sql 
#pgbench -c 1000 -T 1000000 -f /pgbench-update-3.sql 
