begin;
update orders set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where int_notnull_1<5 and updated_at > NOW() - '10 minute'::INTERVAL and updated_at < NOW() - '9.9995 minute'::INTERVAL;
commit;
\sleep 2000 ms
