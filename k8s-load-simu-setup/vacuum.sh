#!/bin/bash
echo `date`
ret=`psql -P pager=off -w -c "select query from pg_stat_activity where query like 'vacuum freeze verbose orders;';"`
if (( $?>0 ))
then
  echo "ERR-PSQL"
  exit
fi
ret1=`echo $ret | grep vacuum`
echo $PGHOST
if [ "$ret1" ]
then
  echo $ret1" already running"
else
  psql -P pager=off -w -c "vacuum freeze verbose orders;"
fi
