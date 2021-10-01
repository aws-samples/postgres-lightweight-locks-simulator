#!/bin/sh
  
echo "Creating docker image repositories"
aws cloudformation create-stack --stack-name spotsighandler --template-body file://./ecr-repos.json
