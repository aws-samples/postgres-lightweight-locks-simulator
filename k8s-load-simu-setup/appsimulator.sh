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
prev_selects=0

#simulator sine wave range. From $j to 3.14 in 0.1 increments
_seq=`seq $j 0.021 3.14`
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
  sinx=`echo $i|awk '{print int(sin($1)*1200)}'`
  echo "sinx=" $sinx
  echo "i=" $i
  aws sqs send-message --queue-url ${QUEUE_URL} --message-body "$i"

  updates=`echo $(( sinx * 3 ))`
  inserts=`echo $(( sinx * 3/2 ))`
  selects=`echo $(( sinx / 5 ))`
  queue_size=`aws sqs get-queue-attributes --queue-url ${APP_QUEUE_URL} --attribute-names ApproximateNumberOfMessages| jq '.Attributes.ApproximateNumberOfMessages'|sed 's/"//g'`
  echo "queue_size="$queue_size
  if (( $queue_size >= 1000 )); then
    updates=`echo $(( updates * 2 ))`
    echo "queue_size was large - more update workers updates="$updates
  fi
  deploys=`kubectl get deploy | grep app| awk '{print $1}'`
  for deploy in $deploys
  do
   if [[ "$deploy" == "appinsert"* ]]; then
      #if (( $inserts == $prev_inserts && $sinx >= 99 )); then
      #  echo 'skip long peaks'
      #  continue
      #else
        kubectl scale deploy/$deploy --replicas=$inserts
        aws cloudwatch put-metric-data --metric-name current_inserts --namespace ${DEPLOY_NAME} --value ${inserts}
        echo "inserts="$inserts" sinx="$sinx
      #fi
   fi
   if [[ "$deploy" == "appupdate"* ]]; then
      #if (( $updates == $prev_updates && $sinx >= 99 )); then
      #  echo 'skip long peaks'
      #  continue
      #else
        kubectl scale deploy/$deploy --replicas=$updates
        aws cloudwatch put-metric-data --metric-name current_updates --namespace ${DEPLOY_NAME} --value ${updates}
        echo "updates="$updates" sinx="$sinx
      #fi
   fi
   if [[ "$deploy" == "appselect"* ]]; then
      #if (( $selects == $prev_selects && $sinx >= 99 )); then
      #  echo 'skip long peaks'
      #  continue
      #else
        kubectl scale deploy/$deploy --replicas=$selects
        aws cloudwatch put-metric-data --metric-name current_selects --namespace ${DEPLOY_NAME} --value ${selects}
        echo "selects="$selects" sinx="$sinx
      #fi
   fi
  done

  prev_inserts=$inserts
  prev_updates=$updates
  prev_selects=$selects
  sleeptime=`awk -v min=$MIN_SLEEP_BETWEEN_CYCLE -v max=$MAX_SLEEP_BETWEEN_CYCLE 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
  echo "cleanning not ready nodes and faulty pods"
  kubectl delete po `kubectl get po | egrep 'Evicted|CrashLoopBackOff|CreateContainerError|ExitCode|OOMKilled|RunContainerError'|awk '{print $1}'`
  sleep $sleeptime"m"
done
_seq=`seq 0.01 0.021 3.14`
echo "new cycle "$_seq
done
