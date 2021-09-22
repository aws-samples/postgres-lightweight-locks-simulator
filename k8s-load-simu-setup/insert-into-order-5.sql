BEGIN;
insert into orders(
created_at,
updated_at,
int_notnull_1, int_notnull_2, int_notnull_3, int_notnull_4, int_notnull_5, int_notnull_6, int_notnull_7, int_notnull_8, int_notnull_9, int_notnull_10,

int_null_1, int_null_2, int_null_3, int_null_4, int_null_5, int_null_6, int_null_7, int_null_8, int_null_9, int_null_10, int_null_11, int_null_12, int_null_13, int_null_14, int_null_15, int_null_16, int_null_17, int_null_18, int_null_19, int_null_20, int_null_21, int_null_22, int_null_23,

bigint_nonull_1, bigint_nonull_2, bigint_nonull_3,

bigint_null_1, bigint_null_2, bigint_null_3, bigint_null_4, bigint_null_5, bigint_null_6, bigint_null_7, bigint_null_8, bigint_null_9, bigint_null_10, bigint_null_11, bigint_null_12, bigint_null_13, bigint_null_14, bigint_null_15, bigint_null_16,

timestamp_null_1, timestamp_null_2, timestamp_null_3, timestamp_null_4, timestamp_null_5, timestamp_null_6, timestamp_null_7, timestamp_null_8, timestamp_null_9, timestamp_null_10, timestamp_null_11, timestamp_null_12, timestamp_null_13, timestamp_null_14, timestamp_null_15, timestamp_null_16, timestamp_null_17, timestamp_null_18, timestamp_null_19, timestamp_null_20, timestamp_null_21, timestamp_null_22, timestamp_null_23, timestamp_null_24, timestamp_null_25, timestamp_null_26, timestamp_null_27,

text_notnull_1
)
values(
NOW(),
NOW(),
1,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,

floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,floor(random() * 10000 + 1)::int,

floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,

floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,floor(random() * 10000 + 1)::bigint,

NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),NOW(),
md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)||md5(RANDOM()::TEXT)
)
on conflict do nothing RETURNING id ;
insert into orders50 select * from orders where id>(select max(id)-1 from orders) on conflict do nothing;
insert into orders51 select * from orders where id>(select max(id)-1 from orders) on conflict do nothing;
insert into orders52 select * from orders where id>(select max(id)-1 from orders) on conflict do nothing;
insert into orders53 select * from orders where id>(select max(id)-1 from orders) on conflict do nothing;
insert into orders54 select * from orders where id>(select max(id)-1 from orders) on conflict do nothing;
insert into orders55 select * from orders where id>(select max(id)-1 from orders) on conflict do nothing;
insert into orders56 select * from orders where id>(select max(id)-1 from orders) on conflict do nothing;
insert into orders57 select * from orders where id>(select max(id)-1 from orders) on conflict do nothing;
insert into orders58 select * from orders where id>(select max(id)-1 from orders) on conflict do nothing;
insert into orders59 select * from orders where id>(select max(id)-1 from orders) on conflict do nothing;
commit
;
