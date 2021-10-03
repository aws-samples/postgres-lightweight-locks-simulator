#!/bin/bash
#restore simulator state from SQS in the case of previous run
sqs_file="/tmp/"$RANDOM".json"
aws sqs receive-message --queue-url ${QUEUE_URL} > $sqs_file
echo "sqs exit code="$?
if (( $?>0 ))
then
  echo "ERR-SQS"
  j=0.1
else
  receipt_handle=`cat $sqs_file | jq '.Messages[].ReceiptHandle'|sed 's/"//g'`
  j=`cat $sqs_file | jq '.Messages[].Body'|sed 's/"//g'`
  if [ -z "$j" ]
  then
    echo "EMPTY-SQS"
    j=0
  fi
fi
rm -f $sqs_file

prev_inserts=0
prev_updates=0

#simulator sine wave range. From $j to 3.14 in 0.1 increments
_seq=`seq $j 0.1 3.14`
echo "first seq is "$_seq
while true; do
for i in $_seq; do
  sqs_file="/tmp/"$RANDOM".json"
  aws sqs receive-message --queue-url ${QUEUE_URL} > $sqs_file
  if (( $?<=0 )); then
    receipt_handle=`cat $sqs_file | jq '.Messages[].ReceiptHandle'|sed 's/"//g'`
    if [ -n "$receipt_handle" ]; then
      echo "delete msg receipt_handle="$receipt_handle
      aws sqs delete-message --queue-url ${QUEUE_URL} --receipt-handle $receipt_handle
    fi
  fi
  rm -f $sqs_file
  x=`echo $i|awk '{print $1}'`
  sinx=`echo $i|awk '{print int(sin($1)*90)}'`
  echo "sinx=" $sinx
  echo "i=" $i
  aws sqs send-message --queue-url ${QUEUE_URL} --message-body "$i"

#handle pgbench spike case
  if (( $(echo "$i == 1.41" | bc -l ))) ; then
    kubectl scale deploy pgbench --replicas=1  
  else
    kubectl scale deploy pgbench --replicas=0  
  fi
#end of pgbench case

  updates=`echo $(( sinx * 3 + 1 ))`
  inserts=`echo $(( sinx * 3/2 + 1 ))`
  deploys=`kubectl get deploy | grep app| awk '{print $1}'`
  for deploy in $deploys
  do
   if [[ "$deploy" == "appinsert"* ]]; then
      if (( $inserts == $prev_inserts && $sinx >= 99 )); then
        echo 'skip long peaks'
        continue
      else
        kubectl scale deploy/$deploy --replicas=$inserts
        aws cloudwatch put-metric-data --metric-name current_inserts --namespace ${DEPLOY_NAME} --value ${inserts}
        echo "inserts="$inserts" sinx="$sinx
      fi
   fi
   if [[ "$deploy" == "appupdate"* ]]; then
      if (( $updates == $prev_updates && $sinx >= 99 )); then
        echo 'skip long peaks'
        continue
      else
        kubectl scale deploy/$deploy --replicas=$updates
        aws cloudwatch put-metric-data --metric-name current_updates --namespace ${DEPLOY_NAME} --value ${updates}
        echo "updates="$updates" sinx="$sinx
      fi
   fi
  done

  prev_inserts=$inserts
  prev_updates=$updates
  sleeptime=`awk -v min=$MIN_SLEEP_BETWEEN_CYCLE -v max=$MAX_SLEEP_BETWEEN_CYCLE 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
  sleep $sleeptime"m"
done
_seq=`seq 0.01 0.1 3.14`
#_seq=`seq 0.01 0.2 2.85`
echo "new cycle "$_seq
echo "cleanning not ready nodes and faulty pods"
kubectl delete po `kubectl get po | egrep 'Evicted|ImagePullBackOff'| awk '{print $1}'`
aws ec2 terminate-instances --instance-ids `kubectl  get no -L alpha.eksctl.io/instance-id | grep NotReady | awk '{print $NF}'`
done
