#!/bin/bash 
netstat=$(mktemp)
n_db_conn=$default_pool_size
new_pgb_proc=0

while true
do
  #TODO - test the case of long running pods - more than hours
  current_pod_age=$(kubectl get po $POD_NAME | awk '{print $NF}'|grep m | awk -F\m '{print $1}')
  if [ -z "$current_pod_age" ]
  then
    echo "current_pod_age is too young (empty); continue"
    continue
  fi
  if (( $current_pod_age < 5 ))
  then
    echo "too young pod; continue"
    continue
  fi
  current_pgb_proc=$(kubectl get deploy pgbouncer | grep -v NAME| awk '{print $3}')
  current_n_conn=$(echo $(( $current_pgb_proc * $n_db_conn ))) 
  if (( $current_n_conn > 4000 ))
  then
    echo "more than 4000 conn; skip scale up"
    is_max=1
  else
    is_max=0
  fi
  netstat -an| grep tcp| awk '{print $NF}'|sort | uniq -c | awk '{printf "%s %s\n",$2,$1}' > $netstat
  established_conn=$(cat $netstat | grep ESTABLISHED | awk '{print $2}')
  if [ -z "$established_conn" ] 
  then 
    echo "established_conn is empty; continue"
    continue
  fi
  if (( $established_conn > $n_db_conn )) && (( $is_max == 0 ))
  then
    echo "pod is at max capacity. scaling faster"
    new_pgb_proc=$(echo $(( $current_pgb_proc + 10 )))  
  else  
    if (( $established_conn > $n_db_conn / 2 )) && (( $is_max == 0 ))
    then
      echo "pod is at 50% of its capacity. scaling up"
      new_pgb_proc=$(echo $(( $current_pgb_proc + 1 )))  
    else 
      if (( $established_conn < $n_db_conn / 10 ))
      then
        echo "pod is at 10% of its capacity. scaling down"
        new_pgb_proc=$(echo $(( $current_pgb_proc - 1 )))  
      fi
    fi
  fi
  if (( $new_pgb_proc > 0 ))
  then
    aws cloudwatch put-metric-data --metric-name num_pgb_proc --namespace pgbouncer --value $new_pgb_proc
    kubectl scale deploy pgbouncer --replicas=$new_pgb_proc 
    new_pgb_proc=0
  fi
  sleep $(awk -v min=900 -v max=1900 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
done
