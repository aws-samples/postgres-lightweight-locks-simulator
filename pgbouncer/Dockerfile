FROM ubuntu:20.04

RUN apt-get -y update && \
    apt-get -y install pgbouncer=1.12.0-3 --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /var/lib/postgresql/pgbouncer && \
    chown postgres /var/lib/postgresql/pgbouncer

RUN apt -y update && apt-get -y install net-tools curl vim unzip less

# Install kubectl for pgbouncer pod scaler
RUN apt-get install -y apt-transport-https ca-certificates
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl
RUN kubectl version --client

#Install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN mkdir /root/.aws
COPY config /root/.aws

# Installed with pgbouncer
USER postgres

WORKDIR /var/lib/postgresql/pgbouncer

RUN mkdir /var/lib/postgresql/.aws
COPY config /var/lib/postgresql/.aws
COPY ./start.sh /start.sh
COPY ./pub_metrics.sh /pub_metrics.sh
COPY ./adaptivepgbouncer.sh /adaptivepgbouncer.sh

ENTRYPOINT ["/bin/bash", "/start.sh"]
