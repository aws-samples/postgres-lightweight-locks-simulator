begin;
update orders50 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and int_notnull_1<3 and updated_at > NOW() - '10 minute'::INTERVAL and updated_at < NOW() - '9.9995 minute'::INTERVAL;
update orders51 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and int_notnull_1<5 and updated_at > NOW() - '10 minute'::INTERVAL;
update orders52 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and created_at>NOW() - '9.9995 minute'::INTERVAL;
update orders53 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and updated_at>NOW() - '10 minute'::INTERVAL;
update orders54 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and created_at>NOW() - '9.9995 minute'::INTERVAL and idempotency_key>'"$id"';
update orders55 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and int_notnull_1<3 and updated_at > NOW() - '90 minute'::INTERVAL and updated_at < NOW() - '100 minute'::INTERVAL;
update orders56 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id in (select id from orders where id>'"$id"' limit 2);
update orders57 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id in (select id from orders where id>'"$id"' limit 2);
update orders58 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and updated_at>NOW() - '10 minute'::INTERVAL;
update orders59 set int_notnull_1=int_notnull_2+1,updated_at=NOW(),timestamp_null_1=NOW() where id='"$id"' and created_at>NOW() - '9.9995 minute'::INTERVAL and idempotency_key>'"$id"';
update orders set int_notnull_1=int_notnull_2+1,updated_at=NOW() where id='"$id"';
commit;
\sleep 20 ms
