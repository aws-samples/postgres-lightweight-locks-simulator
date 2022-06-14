BEGIN;
/*insert-into-order*/insert into orders(
created_at,
updated_at,
int_notnull_1,int_notnull_2,int_notnull_3,int_notnull_4,
int_null_1,int_null_2,int_null_3,
bigint_nonull_1,
bigint_null_1, 
timestamp_null_1,
text_notnull_1
)
values(
NOW(),
NOW(),
floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,

floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,

floor(random() * 10000 + 1)::bigint,

floor(random() * 10000 + 1)::bigint,

NOW(),
md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)
)
--uncomment with partitionning
--on conflict do nothing RETURNING public_id,created_at;
on conflict do nothing RETURNING public_id;
commit
;
