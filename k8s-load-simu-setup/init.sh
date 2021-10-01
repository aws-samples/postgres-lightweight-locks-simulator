#!/bin/sh

apt-get -y --fix-missing update
apt-get install -y curl vim unzip 

apt-get -y -qq update && \
        apt-get install -y -qq curl && \
        apt-get clean
curl -o /usr/local/bin/jq http://stedolan.github.io/jq/download/linux64/jq && \
  chmod +x /usr/local/bin/jq

# Install and configure psql
DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql
apt-get install --no-install-recommends -y python3.8 python3-pip python3.8-dev
python3 -m pip install pg8000

apt-get install -y bc

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

curl -f -s -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    kubectl version --client

apt-get install -y postgresql-contrib
