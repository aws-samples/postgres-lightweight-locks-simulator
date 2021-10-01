#!/bin/bash

apt-get update
apt-get install -y postgresql-client 
rm -rf /var/lib/apt/lists/*

pip install -r requirements.txt

cd /usr/src/app
python ./manage.py runsslserver 0.0.0.0:8000
