#!/bin/bash
kubectl config current-context
echo "========DEPLOY==============="
kubectl get deploy
echo "========PODS================"
kubectl get po |grep -v STATUS| awk '{print $3}'| sort | uniq -c
echo "========NODES==============="
kubectl get no |grep -v STATUS| awk '{print $2}'| sort | uniq -c
echo "========CRONJOB==============="
kubectl get cj |grep -v STATUS| awk '{print $4}'| sort | uniq -c
echo "========STATS==============="
kubectl get po -o wide| awk '{print $7}'| sort | uniq -c | awk '{sum+=$1;n++}END{print "average pods/node="sum/n}'
echo "========CLEANNING==============="
kubectl delete po `kubectl get po | egrep 'Evicted|CrashLoopBackOff|CreateContainerError|ExitCode|OOMKilled|RunContainerError|Terminating'|awk '{print $1}'`
aws ec2 terminate-instances --instance-ids `kubectl  get no -L alpha.eksctl.io/instance-id | grep NotReady | awk '{print $NF}'` --no-cli-pager
