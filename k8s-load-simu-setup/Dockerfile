FROM ubuntu
RUN apt-get -y --fix-missing update
RUN apt-get install -y curl vim unzip 

RUN apt-get -y -qq update && \
        apt-get install -y -qq curl && \
        apt-get clean
RUN curl -o /usr/local/bin/jq http://stedolan.github.io/jq/download/linux64/jq && \
  chmod +x /usr/local/bin/jq

# Install and configure psql
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql
RUN apt-get install --no-install-recommends -y python3.8 python3-pip python3.8-dev
RUN python3 -m pip install pg8000
ADD .psqlrc /root/.psqlrc

#Install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN mkdir /root/.aws
COPY config /root/.aws

#Install kubectl for the simulator pod scaler
RUN curl -f -s -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    kubectl version --client

ADD app-insert.sh /app-insert.sh
ADD appsimulator.sh /appsimulator.sh
ADD insert-2-db-and-sqs.sh /insert-2-db-and-sqs.sh

#Populate orders table in bulks
ADD bulk-inserts.sh /bulk-inserts.sh
ADD series-inserts.sh /series-inserts.sh
ADD insert-into-order-series.sql /insert-into-order-series.sql
ADD insert-into-order.sql /insert-into-order.sql
ADD insert-into-order-1.sql /insert-into-order-1.sql
ADD insert-into-order-2.sql /insert-into-order-2.sql
ADD insert-into-order-3.sql /insert-into-order-3.sql
ADD insert-into-order-4.sql /insert-into-order-4.sql
ADD insert-into-order-5.sql /insert-into-order-5.sql
ADD insert-into-order-6.sql /insert-into-order-6.sql
ADD insert-into-order-7.sql /insert-into-order-7.sql
ADD insert-into-order-many.sql /insert-into-order-many.sql

#Scheduled vacuum
ADD vacuum.sh /vacuum.sh

#Simulation code - updates and inserts
ADD app-update.sh /app-update.sh
ADD app-update-1.sh /app-update-1.sh
ADD app-update-2.sh /app-update-2.sh
ADD app-update-3.sh /app-update-3.sh
ADD app-update-4.sh /app-update-4.sh
ADD app-update-5.sh /app-update-5.sh
ADD app-update-6.sh /app-update-6.sh
ADD app-update-7.sh /app-update-7.sh
ADD app-insert-1.sh /app-insert-1.sh
ADD app-insert-2.sh /app-insert-2.sh
ADD app-insert-3.sh /app-insert-3.sh
ADD app-insert-4.sh /app-insert-4.sh
ADD app-insert-5.sh /app-insert-5.sh
ADD app-insert-6.sh /app-insert-6.sh
ADD app-insert-7.sh /app-insert-7.sh
ADD app-update-from-sqs.sh /app-update-from-sqs.sh
ADD app-update-from-func.sh /app-update-from-func.sh
ADD app-insert.sh /app-insert.sh
ADD insert-2-db-and-sqs.sh /insert-2-db-and-sqs.sh
ADD app-load.sh /app-load.sh

#PG snapshot for debugging
ADD pg-io-snapshot.sh /pg-io-snapshot.sh 
ADD snapper_rds /snapper_rds

#PGBENCH Install
RUN apt-get install -y postgresql-contrib
ADD start-pgbench.sh /start-pgbench.sh 
ADD pgbench-insert.sql /pgbench-insert.sql
ADD pgbench-update.sql /pgbench-update.sql
ADD pgbench-insert-1.sql /pgbench-insert-1.sql
ADD pgbench-update-1.sql /pgbench-update-1.sql
ADD pgbench-insert-2.sql /pgbench-insert-2.sql
ADD pgbench-update-2.sql /pgbench-update-2.sql
ADD pgbench-insert-3.sql /pgbench-insert-3.sql
ADD pgbench-update-3.sql /pgbench-update-3.sql
RUN apt-get install -y bc
