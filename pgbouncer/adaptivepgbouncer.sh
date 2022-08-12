#!/bin/bash 
netstat=$(mktemp)
n_db_conn=$default_pool_size
new_pgb_proc=0

while true
do
  pod_start_str=$(kubectl get po $POD_NAME -o jsonpath="{..status.containerStatuses[].state.running.startedAt}")
  pod_start_sec=$(date --date $pod_start_str "+%s")
  pod_now_sec=$(date "+%s")
  pod_age_sec=$(echo $(( (pod_now_sec-pod_start_sec) / 60 )))
  if (( $pod_age_sec < 3 ))
  then
    echo "pod is too young pod_age_sec is "$pod_age_sec
    continue
  fi

  current_pgb_proc=$(kubectl get deploy pgbouncer | grep -v NAME| awk '{print $3}')
  current_n_conn=$(echo $(( $current_pgb_proc * $n_db_conn ))) 
  echo "current_pgb_proc="$current_pgb_proc
  echo "current_n_conn="$current_n_conn
  if (( $current_n_conn > 4000 ))
  then
    echo "more than 4000 conn; skip scale up"
    is_max=1
  else
    is_max=0
  fi
  netstat -an| grep tcp| awk '{print $NF}'|sort | uniq -c | awk '{printf "%s %s\n",$2,$1}' > $netstat
  established_conn=$(cat $netstat | grep ESTABLISHED | awk '{print $2}')
  echo "established_conn="$established_conn
  if [ -z "$established_conn" ] 
  then 
    echo "established_conn is empty; continue"
    continue
  fi
  echo "n_db_conn="$n_db_conn
  echo "handling scale up"
  if (( $established_conn >= $n_db_conn )) && (( $is_max == 0 ))
  then
    new_pgb_proc=$(echo $(( $current_pgb_proc + 10 )))  
    echo "pod is at max capacity. scaling faster from "$current_pgb_proc" to "$new_pgb_proc
  else  
    if (( $established_conn >= $n_db_conn / 2 )) && (( $is_max == 0 ))
    then
      new_pgb_proc=$(echo $(( $current_pgb_proc + 1 )))  
      echo "pod is at 50% of its capacity. scaling up from "$current_pgb_proc" to "$new_pgb_proc
    fi
  fi
  echo "handling scale down"
  if (( $established_conn <= $n_db_conn / 5 )) 
  then
    new_pgb_proc=$(echo $(( $current_pgb_proc - 1 )))  
    echo "pod is at 10% of its capacity. scaling down from "$current_pgb_proc" to "$new_pgb_proc
  fi
  echo "new_pgb_proc="$new_pgb_proc
  if (( $new_pgb_proc > 0 ))
  then
    echo aws cloudwatch put-metric-data --metric-name num_pgb_proc --namespace pgbouncer --value $new_pgb_proc
    aws cloudwatch put-metric-data --metric-name num_pgb_proc --namespace pgbouncer --value $new_pgb_proc 
    echo "cloudwatch exit code="$?
    if (( $?>0 ))
    then
      echo "ERR-CW"
    fi
    echo kubectl scale deploy pgbouncer --replicas=$new_pgb_proc 
    kubectl scale deploy pgbouncer --replicas=$new_pgb_proc 
    new_pgb_proc=0
  else
    echo "no need to scale; established_conn="$established_conn" and n_db_conn="$n_db_conn
  fi
  sleep $(awk -v min=240 -v max=360 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
done
