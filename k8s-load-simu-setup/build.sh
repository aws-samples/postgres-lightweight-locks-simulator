#!/bin/bash
  
account=$(aws sts get-caller-identity --output text --query Account)
region="us-west-2"
repo="simu-app-load"
repo_name='.dkr.ecr.'$region'.amazonaws.com/'$repo':aarch64'
repo_url=$account$repo_name

aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $repo_url
docker build -t $repo -f ./Dockerfile .
docker tag $repo:latest $repo_url
docker push $repo_url
