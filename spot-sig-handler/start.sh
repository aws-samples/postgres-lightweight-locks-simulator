#!/bin/sh

echo "Starting the spot int handler"

if [ "${NAMESPACE}" == "" ]; then
  echo '[ERROR] Environment variable `NAMESPACE` has no value set.' 1>&2
  exit 1
fi

if [ "${POD_NAME}" == "" ]; then
  echo '[ERROR] Environment variable `POD_NAME` has no value set.' 1>&2
  exit 1
fi

echo "Getting the node name"
NODE_NAME=$(kubectl --namespace ${NAMESPACE} get pod ${POD_NAME} --output jsonpath="{.spec.nodeName}")
echo NODE_NAME=${NODE_NAME}

if [ "${NODE_NAME}" == "" ]; then
  echo "[ERROR] Unable to fetch the name of the node running the pod \"${POD_NAME}\" in the namespace \"${NAMESPACE}\"." 1>&2
  exit 1
fi

echo "Gather some information"
INSTANCE_ID_URL=${INSTANCE_ID_URL:-http://169.254.169.254/latest/meta-data/instance-id}
INSTANCE_ID=$(curl -s ${INSTANCE_ID_URL})
echo INSTANCE_ID_URL=${INSTANCE_ID_URL}
echo INSTANCE_ID=${INSTANCE_ID}

NODE=`curl -s 169.254.169.254/latest/meta-data/local-hostname`
INSTANCE_ID=`curl -s 169.254.169.254/latest/meta-data/instance-id`

kubectl label nodes ${NODE} instance-id=${INSTANCE_ID}

echo "\`kubectl drain ${NODE_NAME}\` will be executed once a termination notice is made."


POLL_INTERVAL=${POLL_INTERVAL:-5}
NOTICE_URL=${NOTICE_URL:-http://169.254.169.254/latest/meta-data/spot/termination-time}
#NOTICE_URL=${NOTICE_URL:-http://169.254.169.254/latest/meta-data/events/recommendations/rebalance}

echo "Polling ${NOTICE_URL} every ${POLL_INTERVAL} second(s)"

while http_status=$(curl -o /dev/null -w '%{http_code}' -sL ${NOTICE_URL}); [ ${http_status} -ne 200 ]; do
  echo $(date): ${http_status}
  sleep ${POLL_INTERVAL}
done

echo $(date): "events/recommendations/rebalance"
echo $(date): ${http_status}

DATETIME=`date`

MESSAGE="[{'instance_id': $INSTANCE_ID,'status':'spot termination','public_hostname':${NODE_NAME},'datetime': ${DATETIME},'region':${AWS_DEFAULT_REGION}]"
aws sqs send-message --queue-url ${QUEUE_URL} --message-body "${MESSAGE}"

echo "Draining the nodei due to spot rebalance recommendations."
#kubectl drain ${NODE_NAME} --force --ignore-daemonsets --delete-emptydir-data

echo "Sleep for 200 seconds to prevent raise condition"
# The instance should be terminated by the end of the sleep assumming 120 sec notification time. Rebalance recommendations might take longer
sleep 200
