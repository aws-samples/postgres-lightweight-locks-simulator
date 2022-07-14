FROM 498254202105.dkr.ecr.us-west-2.amazonaws.com/simu-app-load-base:arm0.2
ADD app-insert.sh /app-insert.sh
ADD appsimulator.sh /appsimulator.sh
ADD insert-2-db-and-sqs.sh /insert-2-db-and-sqs.sh

#Populate orders table in bulks
ADD bulk-inserts.sh /bulk-inserts.sh
ADD series-inserts.sh /series-inserts.sh
ADD insert-into-order.sql /insert-into-order.sql
ADD insert-into-order-small.sql /insert-into-order-small.sql
ADD insert-into-order-small-series.sql /insert-into-order-small-series.sql

#Scheduled vacuum
ADD vacuum.sh /vacuum.sh

#Simulation code - updates and inserts
ADD app-update.sh /app-update.sh
ADD app-update-from-sqs.sh /app-update-from-sqs.sh
ADD app-update-from-func.sh /app-update-from-func.sh
ADD app-insert.sh /app-insert.sh
ADD insert-2-db-and-sqs.sh /insert-2-db-and-sqs.sh
ADD app-load.sh /app-load.sh

#PG snapshot for debugging
ADD pg-io-snapshot.sh /pg-io-snapshot.sh 
ADD snapper_rds /snapper_rds

#PGBENCH Install
ADD start-pgbench.sh /start-pgbench.sh 
ADD pgbench-insert.sql /pgbench-insert.sql
ADD pgbench-update.sql /pgbench-update.sql

#Daemon Set
ADD ds-start.sh /ds-start.sh
