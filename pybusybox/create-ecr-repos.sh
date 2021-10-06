#!/bin/sh
  
echo "Creating docker image repositories"
aws cloudformation create-stack --stack-name py-busywork-repos --template-body file://./ecr-repos.json
