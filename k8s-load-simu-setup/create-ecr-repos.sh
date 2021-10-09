#!/bin/sh
  
echo "Creating docker image repositories"
aws cloudformation create-stack --stack-name ecr-simu-app-load-base --template-body file://./ecr-simu-app-load-base.json
aws cloudformation create-stack --stack-name ecr-simu-app-load --template-body file://./ecr-simu-app-load.json
