/*
CREATE SEQUENCE orders_id_seq START 1;
CREATE SEQUENCE orders_pub_id_seq START 1;
CREATE SEQUENCE orders_idemp_seq START 1;
CREATE SEQUENCE orders_uuid_seq START 1;

CREATE TABLE public.orders (
    id bigint DEFAULT nextval('public.orders_id_seq'::regclass) PRIMARY KEY,
    public_id bigint DEFAULT nextval('public.orders_pub_id_seq'::regclass) NOT NULL,
    idempotency_key bigint DEFAULT nextval('public.orders_idemp_seq'::regclass) NOT NULL,
    orders_uuid bigint DEFAULT nextval('public.orders_uuid_seq'::regclass) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,

    int_notnull_1 integer NOT NULL,
    int_notnull_2 integer NOT NULL,
    int_notnull_3 integer NOT NULL,
    int_notnull_4 integer NOT NULL,
    int_notnull_5 integer NOT NULL,
    int_notnull_6 integer NOT NULL,
    int_notnull_7 integer NOT NULL,
    int_notnull_8 integer NOT NULL,
    int_notnull_9 integer NOT NULL,
    int_notnull_10 integer NOT NULL,
    int_null_1 integer,
    int_null_2 integer,
    int_null_3 integer,
    int_null_4 integer,
    int_null_5 integer,
    int_null_6 integer,
    int_null_7 integer,
    int_null_8 integer,
    int_null_9 integer,
    int_null_10 integer,
    int_null_11 integer,
    int_null_12 integer,
    int_null_13 integer,
    int_null_14 integer,
    int_null_15 integer,
    int_null_16 integer,
    int_null_17 integer,
    int_null_18 integer,
    int_null_19 integer,
    int_null_20 integer,
    int_null_21 integer,
    int_null_22 integer,
    int_null_23 integer,

    bigint_nonull_1 bigint NOT NULL,
    bigint_nonull_2 bigint NOT NULL,
    bigint_nonull_3 bigint NOT NULL,
    bigint_null_1 bigint,
    bigint_null_2 bigint,
    bigint_null_3 bigint,
    bigint_null_4 bigint,
    bigint_null_5 bigint,
    bigint_null_6 bigint,
    bigint_null_7 bigint,
    bigint_null_8 bigint,
    bigint_null_9 bigint,
    bigint_null_10 bigint,
    bigint_null_11 bigint,
    bigint_null_12 bigint,
    bigint_null_13 bigint,
    bigint_null_14 bigint,
    bigint_null_15 bigint,
    bigint_null_16 bigint,

    timestamp_null_1 timestamp with time zone,
    timestamp_null_2 timestamp with time zone,
    timestamp_null_3 timestamp with time zone,
    timestamp_null_4 timestamp with time zone,
    timestamp_null_5 timestamp with time zone,
    timestamp_null_6 timestamp with time zone,
    timestamp_null_7 timestamp with time zone,
    timestamp_null_8 timestamp with time zone,
    timestamp_null_9 timestamp with time zone,
    timestamp_null_10 timestamp with time zone,
    timestamp_null_11 timestamp with time zone,
    timestamp_null_12 timestamp with time zone,
    timestamp_null_13 timestamp with time zone,
    timestamp_null_14 timestamp with time zone,
    timestamp_null_15 timestamp with time zone,
    timestamp_null_16 timestamp with time zone,
    timestamp_null_17 timestamp with time zone,
    timestamp_null_18 timestamp with time zone,
    timestamp_null_19 timestamp with time zone,
    timestamp_null_20 timestamp with time zone,
    timestamp_null_21 timestamp with time zone,
    timestamp_null_22 timestamp with time zone,
    timestamp_null_23 timestamp with time zone,
    timestamp_null_24 timestamp with time zone,
    timestamp_null_25 timestamp with time zone,
    timestamp_null_26 timestamp with time zone,
    timestamp_null_27 timestamp with time zone,

    text_notnull_1 text NOT NULL
);
 
ALTER TABLE ONLY public.orders ADD CONSTRAINT orders_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE ONLY public.orders ADD CONSTRAINT orders_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders_created_at ON public.orders USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders_updated_at ON public.orders USING btree (updated_at) WITH (fillfactor='90');
 
CREATE INDEX orders_bigint_null1_partial_key ON public.orders USING btree (bigint_nonull_1) WITH (fillfactor='90') WHERE (bigint_nonull_1 IS NOT NULL);
CREATE INDEX orders_bigint_null2_partial_key ON public.orders USING btree (bigint_nonull_2) WITH (fillfactor='90') WHERE (bigint_nonull_2 IS NOT NULL);
CREATE INDEX orders_bigint_null3_partial_key ON public.orders USING btree (bigint_nonull_3) WITH (fillfactor='90') WHERE (bigint_nonull_3 IS NOT NULL);
 
CREATE INDEX orders_ts_null_1_intnull_2_ts_null_2_partial ON public.orders USING btree (timestamp_null_1, int_notnull_2, timestamp_null_2) WITH (fillfactor='90') WHERE (timestamp_null_1 IS NOT NULL);
CREATE INDEX orders_ts_null_2_intnull_2_ts_null_3_partial ON public.orders USING btree (timestamp_null_2, int_notnull_2, timestamp_null_3) WITH (fillfactor='90') WHERE (timestamp_null_2 IS NOT NULL);
CREATE INDEX orders_ts_null_3_intnull_3_ts_null_4_partial ON public.orders USING btree (timestamp_null_3, int_notnull_3, timestamp_null_4) WITH (fillfactor='90') WHERE (timestamp_null_3 IS NOT NULL);
CREATE INDEX orders_ts_null_4_intnull_2_ts_null_2_partial ON public.orders USING btree (timestamp_null_4, int_notnull_2, timestamp_null_2) WITH (fillfactor='90') WHERE (timestamp_null_4 IS NOT NULL);
CREATE INDEX orders_ts_null_5_intnull_2_ts_null_3_partial ON public.orders USING btree (timestamp_null_5, int_notnull_2, timestamp_null_3) WITH (fillfactor='90') WHERE (timestamp_null_5 IS NOT NULL);
CREATE INDEX orders_ts_null_6_intnull_3_ts_null_4_partial ON public.orders USING btree (timestamp_null_6, int_notnull_3, timestamp_null_4) WITH (fillfactor='90') WHERE (timestamp_null_6 IS NOT NULL);
 
CREATE INDEX orders_timestamp_null_20_partial ON public.orders USING btree (timestamp_null_20) WITH (fillfactor='90') WHERE (timestamp_null_20 IS NOT NULL);
CREATE INDEX orders_timestamp_null_21_partial ON public.orders USING btree (timestamp_null_21) WITH (fillfactor='90') WHERE (timestamp_null_21 IS NOT NULL);
CREATE INDEX orders_timestamp_null_22_partial ON public.orders USING btree (timestamp_null_22) WITH (fillfactor='90') WHERE (timestamp_null_22 IS NOT NULL);
CREATE INDEX orders_timestamp_null_23_partial ON public.orders USING btree (timestamp_null_23) WITH (fillfactor='90') WHERE (timestamp_null_23 IS NOT NULL);
CREATE INDEX orders_timestamp_null_24_partial ON public.orders USING btree (timestamp_null_24) WITH (fillfactor='90') WHERE (timestamp_null_24 IS NOT NULL);
CREATE INDEX orders_timestamp_null_25_partial ON public.orders USING btree (timestamp_null_25) WITH (fillfactor='90') WHERE (timestamp_null_25 IS NOT NULL);
CREATE INDEX orders_timestamp_null_26_partial ON public.orders USING btree (timestamp_null_26) WITH (fillfactor='90') WHERE (timestamp_null_26 IS NOT NULL);
CREATE INDEX orders_timestamp_null_27_partial ON public.orders USING btree (timestamp_null_27) WITH (fillfactor='90') WHERE (timestamp_null_27 IS NOT NULL);
 
 
CREATE INDEX orders_ts_10_ts_20_partial ON public.orders USING btree (timestamp_null_10,timestamp_null_20 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_10 IS NOT NULL) AND (timestamp_null_20 IS NOT NULL));
CREATE INDEX orders_ts_11_ts_20_partial ON public.orders USING btree (timestamp_null_11,timestamp_null_20 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_11 IS NOT NULL) AND (timestamp_null_20 IS NOT NULL));
CREATE INDEX orders_ts_12_ts_20_partial ON public.orders USING btree (timestamp_null_12,timestamp_null_20 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_12 IS NOT NULL) AND (timestamp_null_20 IS NOT NULL));
CREATE INDEX orders_ts_13_ts_20_partial ON public.orders USING btree (timestamp_null_13,timestamp_null_20 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_13 IS NOT NULL) AND (timestamp_null_20 IS NOT NULL));
CREATE INDEX orders_ts_14_ts_20_partial ON public.orders USING btree (timestamp_null_14,timestamp_null_20 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_14 IS NOT NULL) AND (timestamp_null_20 IS NOT NULL));
CREATE INDEX orders_ts_15_ts_20_partial ON public.orders USING btree (timestamp_null_15,timestamp_null_20 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_15 IS NOT NULL) AND (timestamp_null_20 IS NOT NULL));
CREATE INDEX orders_ts_16_ts_20_partial ON public.orders USING btree (timestamp_null_16,timestamp_null_20 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_16 IS NOT NULL) AND (timestamp_null_20 IS NOT NULL));
CREATE INDEX orders_ts_17_ts_20_partial ON public.orders USING btree (timestamp_null_17,timestamp_null_20 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_17 IS NOT NULL) AND (timestamp_null_20 IS NOT NULL));
CREATE INDEX orders_ts_18_ts_20_partial ON public.orders USING btree (timestamp_null_18,timestamp_null_20 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_18 IS NOT NULL) AND (timestamp_null_20 IS NOT NULL));
CREATE INDEX orders_ts_19_ts_20_partial ON public.orders USING btree (timestamp_null_19,timestamp_null_20 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (timestamp_null_20 IS NOT NULL));

CREATE INDEX orders_ts_19_bigint_1 ON public.orders USING btree (timestamp_null_19,bigint_null_1 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_1 IS NOT NULL));
CREATE INDEX orders_ts_19_bigint_2 ON public.orders USING btree (timestamp_null_19,bigint_null_2 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_2 IS NOT NULL));
CREATE INDEX orders_ts_19_bigint_3 ON public.orders USING btree (timestamp_null_19,bigint_null_3 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_3 IS NOT NULL));
CREATE INDEX orders_ts_19_bigint_4 ON public.orders USING btree (timestamp_null_19,bigint_null_4 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_4 IS NOT NULL));
CREATE INDEX orders_ts_19_bigint_5 ON public.orders USING btree (timestamp_null_19,bigint_null_5 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_5 IS NOT NULL));
CREATE INDEX orders_ts_19_bigint_6 ON public.orders USING btree (timestamp_null_19,bigint_null_6 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_6 IS NOT NULL));
CREATE INDEX orders_ts_19_bigint_7 ON public.orders USING btree (timestamp_null_19,bigint_null_7 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_7 IS NOT NULL));
CREATE INDEX orders_ts_19_bigint_8 ON public.orders USING btree (timestamp_null_19,bigint_null_8 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_8 IS NOT NULL));
CREATE INDEX orders_ts_19_bigint_9 ON public.orders USING btree (timestamp_null_19,bigint_null_9 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_9 IS NOT NULL));
CREATE INDEX orders_ts_19_bigint_10 ON public.orders USING btree (timestamp_null_19,bigint_null_10 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_10 IS NOT NULL));
CREATE INDEX orders_ts_19_bigint_11 ON public.orders USING btree (timestamp_null_19,bigint_null_11 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_11 IS NOT NULL));
CREATE INDEX orders_ts_19_bigint_12 ON public.orders USING btree (timestamp_null_19,bigint_null_12 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_19 IS NOT NULL) AND (bigint_null_12 IS NOT NULL));
 

CREATE INDEX orders_ts_27_int_1 ON public.orders USING btree (timestamp_null_27,int_null_1 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_1 IS NOT NULL));
CREATE INDEX orders_ts_27_int_2 ON public.orders USING btree (timestamp_null_27,int_null_2 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_2 IS NOT NULL));
CREATE INDEX orders_ts_27_int_3 ON public.orders USING btree (timestamp_null_27,int_null_3 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_3 IS NOT NULL));
CREATE INDEX orders_ts_27_int_4 ON public.orders USING btree (timestamp_null_27,int_null_4 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_4 IS NOT NULL));
CREATE INDEX orders_ts_27_int_5 ON public.orders USING btree (timestamp_null_27,int_null_5 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_5 IS NOT NULL));
CREATE INDEX orders_ts_27_int_6 ON public.orders USING btree (timestamp_null_27,int_null_6 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_6 IS NOT NULL));
CREATE INDEX orders_ts_27_int_7 ON public.orders USING btree (timestamp_null_27,int_null_7 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_7 IS NOT NULL));
CREATE INDEX orders_ts_27_int_8 ON public.orders USING btree (timestamp_null_27,int_null_8 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_8 IS NOT NULL));
CREATE INDEX orders_ts_27_int_9 ON public.orders USING btree (timestamp_null_27,int_null_9 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_9 IS NOT NULL));
CREATE INDEX orders_ts_27_int_10 ON public.orders USING btree (timestamp_null_27,int_null_10 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_10 IS NOT NULL));
CREATE INDEX orders_ts_27_int_11 ON public.orders USING btree (timestamp_null_27,int_null_11 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_11 IS NOT NULL));
CREATE INDEX orders_ts_27_int_12 ON public.orders USING btree (timestamp_null_27,int_null_12 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_12 IS NOT NULL));
CREATE INDEX orders_ts_27_int_13 ON public.orders USING btree (timestamp_null_27,int_null_13 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_13 IS NOT NULL));
CREATE INDEX orders_ts_27_int_14 ON public.orders USING btree (timestamp_null_27,int_null_14 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_14 IS NOT NULL));
CREATE INDEX orders_ts_27_int_15 ON public.orders USING btree (timestamp_null_27,int_null_15 DESC) WITH (fillfactor='90') WHERE ((timestamp_null_27 IS NOT NULL) AND (int_null_15 IS NOT NULL));
*/
drop table orders1 cascade;
create table orders1 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders2 cascade;
create table orders2 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders3 cascade;
create table orders3 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders4 cascade;
create table orders4 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders5 cascade;
create table orders5 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders6 cascade;
create table orders6 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders7 cascade;
create table orders7 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders8 cascade;
create table orders8 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders9 cascade;
create table orders9 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop sequence orders1_id_seq;
CREATE SEQUENCE orders1_id_seq START 35112864781;

drop sequence orders1_pub_id_seq;
CREATE SEQUENCE orders1_pub_id_seq START 35112864781;

drop sequence orders1_idemp_seq;
CREATE SEQUENCE orders1_idemp_seq START 35112864781;

drop sequence orders1_uuid_seq; 
CREATE SEQUENCE orders1_uuid_seq START 35112864781;

alter table orders1 alter column id set default nextval('orders1_id_seq'::regclass);
alter table orders1 alter column public_id set default nextval('orders1_pub_id_seq'::regclass);
alter table orders1 alter column idempotency_key set default nextval('orders1_idemp_seq'::regclass);
alter table orders1 alter column orders_uuid set default nextval('orders1_uuid_seq'::regclass);
alter table orders1 add primary key (id);
alter table orders1 ADD CONSTRAINT orders1_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders1 ADD CONSTRAINT orders1_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders1_created_at ON orders1 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders1_updated_at ON orders1 USING btree (updated_at) WITH (fillfactor='90');

drop  SEQUENCE orders2_id_seq;
CREATE SEQUENCE orders2_id_seq START 35112864781;

drop SEQUENCE orders2_pub_id_seq;
CREATE SEQUENCE orders2_pub_id_seq START 35112864781;

drop sequence orders2_idemp_seq;
CREATE SEQUENCE orders2_idemp_seq START 35112864781;

drop sequence orders2_uuid_seq;
CREATE SEQUENCE orders2_uuid_seq START 35112864781;

alter table orders2 alter column id set default nextval('orders2_id_seq'::regclass);
alter table orders2 alter column public_id set default nextval('orders2_pub_id_seq'::regclass);
alter table orders2 alter column idempotency_key set default nextval('orders2_idemp_seq'::regclass);
alter table orders2 alter column orders_uuid set default nextval('orders2_uuid_seq'::regclass);
alter table orders2 add primary key (id);
alter table orders2 ADD CONSTRAINT orders2_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders2 ADD CONSTRAINT orders2_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders2_created_at ON orders2 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders2_updated_at ON orders2 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders3_id_seq;
CREATE SEQUENCE orders3_id_seq START 35112864781;

drop SEQUENCE orders3_pub_id_seq ;
CREATE SEQUENCE orders3_pub_id_seq START 35112864781;

drop SEQUENCE orders3_idemp_seq ;
CREATE SEQUENCE orders3_idemp_seq START 35112864781;

drop SEQUENCE orders3_uuid_seq ;
CREATE SEQUENCE orders3_uuid_seq START 35112864781;

alter table orders3 alter column id set default nextval('orders3_id_seq'::regclass);
alter table orders3 alter column public_id set default nextval('orders3_pub_id_seq'::regclass);
alter table orders3 alter column idempotency_key set default nextval('orders3_idemp_seq'::regclass);
alter table orders3 alter column orders_uuid set default nextval('orders3_uuid_seq'::regclass);
alter table orders3 add primary key (id);
alter table orders3 ADD CONSTRAINT orders3_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders3 ADD CONSTRAINT orders3_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders3_created_at ON orders3 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders3_updated_at ON orders3 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders4_id_seq;
CREATE SEQUENCE orders4_id_seq START 35112864781;

drop SEQUENCE orders4_pub_id_seq;
CREATE SEQUENCE orders4_pub_id_seq START 35112864781;

drop SEQUENCE orders4_idemp_seq;
CREATE SEQUENCE orders4_idemp_seq START 35112864781;

drop SEQUENCE orders4_uuid_seq;
CREATE SEQUENCE orders4_uuid_seq START 35112864781;

alter table orders4 alter column id set default nextval('orders4_id_seq'::regclass);
alter table orders4 alter column public_id set default nextval('orders4_pub_id_seq'::regclass);
alter table orders4 alter column idempotency_key set default nextval('orders4_idemp_seq'::regclass);
alter table orders4 alter column orders_uuid set default nextval('orders4_uuid_seq'::regclass);
alter table orders4 add primary key (id);
alter table orders4 ADD CONSTRAINT orders4_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders4 ADD CONSTRAINT orders4_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders4_created_at ON orders4 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders4_updated_at ON orders4 USING btree (updated_at) WITH (fillfactor='90');

DROP SEQUENCE orders5_id_seq;
CREATE SEQUENCE orders5_id_seq START 35112864781;

DROP SEQUENCE orders5_pub_id_seq;
CREATE SEQUENCE orders5_pub_id_seq START 35112864781;

DROP SEQUENCE orders5_idemp_seq;
CREATE SEQUENCE orders5_idemp_seq START 35112864781;

DROP SEQUENCE orders5_uuid_seq;
CREATE SEQUENCE orders5_uuid_seq START 35112864781;

alter table orders5 alter column id set default nextval('orders5_id_seq'::regclass);
alter table orders5 alter column public_id set default nextval('orders5_pub_id_seq'::regclass);
alter table orders5 alter column idempotency_key set default nextval('orders5_idemp_seq'::regclass);
alter table orders5 alter column orders_uuid set default nextval('orders5_uuid_seq'::regclass);
alter table orders5 add primary key (id);
alter table orders5 ADD CONSTRAINT orders5_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders5 ADD CONSTRAINT orders5_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders5_created_at ON orders5 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders5_updated_at ON orders5 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders6_id_seq ;
CREATE SEQUENCE orders6_id_seq START 35112864781;

drop SEQUENCE orders6_pub_id_seq;
CREATE SEQUENCE orders6_pub_id_seq START 35112864781;

drop SEQUENCE orders6_idemp_seq ;
CREATE SEQUENCE orders6_idemp_seq START 35112864781;

drop SEQUENCE orders6_uuid_seq ;
CREATE SEQUENCE orders6_uuid_seq START 35112864781;

alter table orders6 alter column id set default nextval('orders6_id_seq'::regclass);
alter table orders6 alter column public_id set default nextval('orders6_pub_id_seq'::regclass);
alter table orders6 alter column idempotency_key set default nextval('orders6_idemp_seq'::regclass);
alter table orders6 alter column orders_uuid set default nextval('orders6_uuid_seq'::regclass);
alter table orders6 add primary key (id);
alter table orders6 ADD CONSTRAINT orders6_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders6 ADD CONSTRAINT orders6_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders6_created_at ON orders6 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders6_updated_at ON orders6 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders7_id_seq;
CREATE SEQUENCE orders7_id_seq START 35112864781;

drop SEQUENCE orders7_pub_id_seq;
CREATE SEQUENCE orders7_pub_id_seq START 35112864781;

drop SEQUENCE orders7_idemp_seq;
CREATE SEQUENCE orders7_idemp_seq START 35112864781;

drop SEQUENCE orders7_uuid_seq;
CREATE SEQUENCE orders7_uuid_seq START 35112864781;

alter table orders7 alter column id set default nextval('orders7_id_seq'::regclass);
alter table orders7 alter column public_id set default nextval('orders7_pub_id_seq'::regclass);
alter table orders7 alter column idempotency_key set default nextval('orders7_idemp_seq'::regclass);
alter table orders7 alter column orders_uuid set default nextval('orders7_uuid_seq'::regclass);
alter table orders7 add primary key (id);
alter table orders7 ADD CONSTRAINT orders7_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders7 ADD CONSTRAINT orders7_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders7_created_at ON orders7 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders7_updated_at ON orders7 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders8_id_seq;
CREATE SEQUENCE orders8_id_seq START 35112864781;
drop SEQUENCE orders8_pub_id_seq;
CREATE SEQUENCE orders8_pub_id_seq START 35112864781;
drop SEQUENCE orders8_idemp_seq;
CREATE SEQUENCE orders8_idemp_seq START 35112864781;
drop SEQUENCE orders8_uuid_seq;
CREATE SEQUENCE orders8_uuid_seq START 35112864781;

alter table orders8 alter column id set default nextval('orders8_id_seq'::regclass);
alter table orders8 alter column public_id set default nextval('orders8_pub_id_seq'::regclass);
alter table orders8 alter column idempotency_key set default nextval('orders8_idemp_seq'::regclass);
alter table orders8 alter column orders_uuid set default nextval('orders8_uuid_seq'::regclass);
alter table orders8 add primary key (id);
alter table orders8 ADD CONSTRAINT orders8_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders8 ADD CONSTRAINT orders8_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders8_created_at ON orders8 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders8_updated_at ON orders8 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders9_id_seq ;
CREATE SEQUENCE orders9_id_seq START 35112864781;
drop SEQUENCE orders9_pub_id_seq ;
CREATE SEQUENCE orders9_pub_id_seq START 35112864781;
drop SEQUENCE orders9_idemp_seq;
CREATE SEQUENCE orders9_idemp_seq START 35112864781;
drop SEQUENCE orders9_uuid_seq ;
CREATE SEQUENCE orders9_uuid_seq START 35112864781;
alter table orders9 alter column id set default nextval('orders9_id_seq'::regclass);
alter table orders9 alter column public_id set default nextval('orders9_pub_id_seq'::regclass);
alter table orders9 alter column idempotency_key set default nextval('orders9_idemp_seq'::regclass);
alter table orders9 alter column orders_uuid set default nextval('orders9_uuid_seq'::regclass);

alter table orders9 add primary key (id);
alter table orders9 ADD CONSTRAINT orders9_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders9 ADD CONSTRAINT orders9_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders9_created_at ON orders9 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders9_updated_at ON orders9 USING btree (updated_at) WITH (fillfactor='90');

drop table orders10 cascade;
create table orders10 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders11 cascade;
create table orders11 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders12 cascade;
create table orders12 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders13 cascade;
create table orders13 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders14 cascade;
create table orders14 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders15 cascade;
create table orders15 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders16 cascade;
create table orders16 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders17 cascade;
create table orders17 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders18 cascade;
create table orders18 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders19 cascade;
create table orders19 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop SEQUENCE orders10_id_seq ;
CREATE SEQUENCE orders10_id_seq START 35112864781;
drop SEQUENCE orders10_pub_id_seq ;
CREATE SEQUENCE orders10_pub_id_seq START 35112864781;
drop SEQUENCE orders10_idemp_seq;
CREATE SEQUENCE orders10_idemp_seq START 35112864781;
drop SEQUENCE orders10_uuid_seq ;
CREATE SEQUENCE orders10_uuid_seq START 35112864781;

alter table orders10 alter column id set default nextval('orders10_id_seq'::regclass);
alter table orders10 alter column public_id set default nextval('orders10_pub_id_seq'::regclass);
alter table orders10 alter column idempotency_key set default nextval('orders10_idemp_seq'::regclass);
alter table orders10 alter column orders_uuid set default nextval('orders10_uuid_seq'::regclass);

alter table orders10 add primary key (id);
alter table orders10 ADD CONSTRAINT orders10_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders10 ADD CONSTRAINT orders10_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders10_created_at ON orders10 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders10_updated_at ON orders10 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders11_id_seq ;
CREATE SEQUENCE orders11_id_seq START 35112864781;
drop SEQUENCE orders11_pub_id_seq ;
CREATE SEQUENCE orders11_pub_id_seq START 35112864781;
drop SEQUENCE orders11_idemp_seq;
CREATE SEQUENCE orders11_idemp_seq START 35112864781;
drop SEQUENCE orders11_uuid_seq ;
CREATE SEQUENCE orders11_uuid_seq START 35112864781;

alter table orders11 alter column id set default nextval('orders11_id_seq'::regclass);
alter table orders11 alter column public_id set default nextval('orders11_pub_id_seq'::regclass);
alter table orders11 alter column idempotency_key set default nextval('orders11_idemp_seq'::regclass);
alter table orders11 alter column orders_uuid set default nextval('orders11_uuid_seq'::regclass);

alter table orders11 add primary key (id);
alter table orders11 ADD CONSTRAINT orders11_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders11 ADD CONSTRAINT orders11_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders11_created_at ON orders11 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders11_updated_at ON orders11 USING btree (updated_at) WITH (fillfactor='90');





drop SEQUENCE orders12_id_seq ;
CREATE SEQUENCE orders12_id_seq START 35112864781;
drop SEQUENCE orders12_pub_id_seq ;
CREATE SEQUENCE orders12_pub_id_seq START 35112864781;
drop SEQUENCE orders12_idemp_seq;
CREATE SEQUENCE orders12_idemp_seq START 35112864781;
drop SEQUENCE orders12_uuid_seq ;
CREATE SEQUENCE orders12_uuid_seq START 35112864781;
alter table orders12 alter column id set default nextval('orders12_id_seq'::regclass);
alter table orders12 alter column public_id set default nextval('orders12_pub_id_seq'::regclass);
alter table orders12 alter column idempotency_key set default nextval('orders12_idemp_seq'::regclass);
alter table orders12 alter column orders_uuid set default nextval('orders12_uuid_seq'::regclass);

alter table orders12 add primary key (id);
alter table orders12 ADD CONSTRAINT orders12_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders12 ADD CONSTRAINT orders12_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders12_created_at ON orders12 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders12_updated_at ON orders12 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders13_id_seq ;
CREATE SEQUENCE orders13_id_seq START 35112864781;
drop SEQUENCE orders13_pub_id_seq ;
CREATE SEQUENCE orders13_pub_id_seq START 35112864781;
drop SEQUENCE orders13_idemp_seq;
CREATE SEQUENCE orders13_idemp_seq START 35112864781;
drop SEQUENCE orders13_uuid_seq ;
CREATE SEQUENCE orders13_uuid_seq START 35112864781;
alter table orders13 alter column id set default nextval('orders13_id_seq'::regclass);
alter table orders13 alter column public_id set default nextval('orders13_pub_id_seq'::regclass);
alter table orders13 alter column idempotency_key set default nextval('orders13_idemp_seq'::regclass);
alter table orders13 alter column orders_uuid set default nextval('orders13_uuid_seq'::regclass);

alter table orders13 add primary key (id);
alter table orders13 ADD CONSTRAINT orders13_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders13 ADD CONSTRAINT orders13_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders13_created_at ON orders13 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders13_updated_at ON orders13 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders14_id_seq ;
CREATE SEQUENCE orders14_id_seq START 35112864781;
drop SEQUENCE orders14_pub_id_seq ;
CREATE SEQUENCE orders14_pub_id_seq START 35112864781;
drop SEQUENCE orders14_idemp_seq;
CREATE SEQUENCE orders14_idemp_seq START 35112864781;
drop SEQUENCE orders14_uuid_seq ;
CREATE SEQUENCE orders14_uuid_seq START 35112864781;
alter table orders14 alter column id set default nextval('orders14_id_seq'::regclass);
alter table orders14 alter column public_id set default nextval('orders14_pub_id_seq'::regclass);
alter table orders14 alter column idempotency_key set default nextval('orders14_idemp_seq'::regclass);
alter table orders14 alter column orders_uuid set default nextval('orders14_uuid_seq'::regclass);

alter table orders14 add primary key (id);
alter table orders14 ADD CONSTRAINT orders14_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders14 ADD CONSTRAINT orders14_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders14_created_at ON orders14 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders14_updated_at ON orders14 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders15_id_seq ;
CREATE SEQUENCE orders15_id_seq START 35112864781;
drop SEQUENCE orders15_pub_id_seq ;
CREATE SEQUENCE orders10_pub_id_seq START 35112864781;
drop SEQUENCE orders15_idemp_seq;
CREATE SEQUENCE orders15_idemp_seq START 35112864781;
drop SEQUENCE orders15_uuid_seq ;
CREATE SEQUENCE orders15_uuid_seq START 35112864781;
alter table orders15 alter column id set default nextval('orders10_id_seq'::regclass);
alter table orders15 alter column public_id set default nextval('orders10_pub_id_seq'::regclass);
alter table orders15 alter column idempotency_key set default nextval('orders10_idemp_seq'::regclass);
alter table orders15 alter column orders_uuid set default nextval('orders10_uuid_seq'::regclass);

alter table orders15 add primary key (id);
alter table orders15 ADD CONSTRAINT orders15_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders15 ADD CONSTRAINT orders15_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders15_created_at ON orders15 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders15_updated_at ON orders15 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders16_id_seq ;
CREATE SEQUENCE orders16_id_seq START 35112864781;
drop SEQUENCE orders16_pub_id_seq ;
CREATE SEQUENCE orders16_pub_id_seq START 35112864781;
drop SEQUENCE orders16_idemp_seq;
CREATE SEQUENCE orders16_idemp_seq START 35112864781;
drop SEQUENCE orders16_uuid_seq ;
CREATE SEQUENCE orders16_uuid_seq START 35112864781;
alter table orders16 alter column id set default nextval('orders16_id_seq'::regclass);
alter table orders16 alter column public_id set default nextval('orders16_pub_id_seq'::regclass);
alter table orders16 alter column idempotency_key set default nextval('orders16_idemp_seq'::regclass);
alter table orders16 alter column orders_uuid set default nextval('orders16_uuid_seq'::regclass);

alter table orders16 add primary key (id);
alter table orders16 ADD CONSTRAINT orders16_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders16 ADD CONSTRAINT orders16_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders16_created_at ON orders16 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders16_updated_at ON orders16 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders17_id_seq ;
CREATE SEQUENCE orders17_id_seq START 35112864781;
drop SEQUENCE orders17_pub_id_seq ;
CREATE SEQUENCE orders17_pub_id_seq START 35112864781;
drop SEQUENCE orders17_idemp_seq;
CREATE SEQUENCE orders17_idemp_seq START 35112864781;
drop SEQUENCE orders17_uuid_seq ;
CREATE SEQUENCE orders17_uuid_seq START 35112864781;
alter table orders17 alter column id set default nextval('orders17_id_seq'::regclass);
alter table orders17 alter column public_id set default nextval('orders17_pub_id_seq'::regclass);
alter table orders17 alter column idempotency_key set default nextval('orders17_idemp_seq'::regclass);
alter table orders17 alter column orders_uuid set default nextval('orders17_uuid_seq'::regclass);

alter table orders17 add primary key (id);
alter table orders17 ADD CONSTRAINT orders17_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders17 ADD CONSTRAINT orders17_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders17_created_at ON orders17 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders17_updated_at ON orders17 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders18_id_seq ;
CREATE SEQUENCE orders18_id_seq START 35112864781;
drop SEQUENCE orders18_pub_id_seq ;
CREATE SEQUENCE orders18_pub_id_seq START 35112864781;
drop SEQUENCE orders18_idemp_seq;
CREATE SEQUENCE orders18_idemp_seq START 35112864781;
drop SEQUENCE orders18_uuid_seq ;
CREATE SEQUENCE orders18_uuid_seq START 35112864781;
alter table orders18 alter column id set default nextval('orders18_id_seq'::regclass);
alter table orders18 alter column public_id set default nextval('orders18_pub_id_seq'::regclass);
alter table orders18 alter column idempotency_key set default nextval('orders18_idemp_seq'::regclass);
alter table orders18 alter column orders_uuid set default nextval('orders18_uuid_seq'::regclass);

alter table orders18 add primary key (id);
alter table orders18 ADD CONSTRAINT orders18_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders18 ADD CONSTRAINT orders18_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders18_created_at ON orders18 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders18_updated_at ON orders18 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders19_id_seq ;
CREATE SEQUENCE orders19_id_seq START 35112864781;
drop SEQUENCE orders19_pub_id_seq ;
CREATE SEQUENCE orders19_pub_id_seq START 35112864781;
drop SEQUENCE orders19_idemp_seq;
CREATE SEQUENCE orders19_idemp_seq START 35112864781;
drop SEQUENCE orders19_uuid_seq ;
CREATE SEQUENCE orders19_uuid_seq START 35112864781;
alter table orders19 alter column id set default nextval('orders19_id_seq'::regclass);
alter table orders19 alter column public_id set default nextval('orders19_pub_id_seq'::regclass);
alter table orders19 alter column idempotency_key set default nextval('orders19_idemp_seq'::regclass);
alter table orders19 alter column orders_uuid set default nextval('orders19_uuid_seq'::regclass);

alter table orders19 add primary key (id);
alter table orders19 ADD CONSTRAINT orders19_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders19 ADD CONSTRAINT orders19_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders19_created_at ON orders19 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders19_updated_at ON orders19 USING btree (updated_at) WITH (fillfactor='90');

drop table orders20 cascade;
create table orders20 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders21 cascade;
create table orders21 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders22 cascade;
create table orders22 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders23 cascade;
create table orders23 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders24 cascade;
create table orders24 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders25 cascade;
create table orders25 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders26 cascade;
create table orders26 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders27 cascade;
create table orders27 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders28 cascade;
create table orders28 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders29 cascade;
create table orders29 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop SEQUENCE orders20_id_seq ;
CREATE SEQUENCE orders20_id_seq START 35112864781;
drop SEQUENCE orders20_pub_id_seq ;
CREATE SEQUENCE orders20_pub_id_seq START 35112864781;
drop SEQUENCE orders20_idemp_seq;
CREATE SEQUENCE orders20_idemp_seq START 35112864781;
drop SEQUENCE orders20_uuid_seq ;
CREATE SEQUENCE orders20_uuid_seq START 35112864781;

alter table orders20 alter column id set default nextval('orders20_id_seq'::regclass);
alter table orders20 alter column public_id set default nextval('orders20_pub_id_seq'::regclass);
alter table orders20 alter column idempotency_key set default nextval('orders20_idemp_seq'::regclass);
alter table orders20 alter column orders_uuid set default nextval('orders20_uuid_seq'::regclass);

alter table orders20 add primary key (id);
alter table orders20 ADD CONSTRAINT orders20_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders20 ADD CONSTRAINT orders20_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders20_created_at ON orders20 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders20_updated_at ON orders20 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders21_id_seq ;
CREATE SEQUENCE orders21_id_seq START 35112864781;
drop SEQUENCE orders21_pub_id_seq ;
CREATE SEQUENCE orders21_pub_id_seq START 35112864781;
drop SEQUENCE orders21_idemp_seq;
CREATE SEQUENCE orders21_idemp_seq START 35112864781;
drop SEQUENCE orders21_uuid_seq ;
CREATE SEQUENCE orders21_uuid_seq START 35112864781;

alter table orders21 alter column id set default nextval('orders21_id_seq'::regclass);
alter table orders21 alter column public_id set default nextval('orders21_pub_id_seq'::regclass);
alter table orders21 alter column idempotency_key set default nextval('orders21_idemp_seq'::regclass);
alter table orders21 alter column orders_uuid set default nextval('orders21_uuid_seq'::regclass);

alter table orders21 add primary key (id);
alter table orders21 ADD CONSTRAINT orders21_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders21 ADD CONSTRAINT orders21_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders21_created_at ON orders21 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders21_updated_at ON orders21 USING btree (updated_at) WITH (fillfactor='90');





drop SEQUENCE orders22_id_seq ;
CREATE SEQUENCE orders22_id_seq START 35112864781;
drop SEQUENCE orders22_pub_id_seq ;
CREATE SEQUENCE orders22_pub_id_seq START 35112864781;
drop SEQUENCE orders22_idemp_seq;
CREATE SEQUENCE orders22_idemp_seq START 35112864781;
drop SEQUENCE orders22_uuid_seq ;
CREATE SEQUENCE orders22_uuid_seq START 35112864781;
alter table orders22 alter column id set default nextval('orders22_id_seq'::regclass);
alter table orders22 alter column public_id set default nextval('orders22_pub_id_seq'::regclass);
alter table orders22 alter column idempotency_key set default nextval('orders22_idemp_seq'::regclass);
alter table orders22 alter column orders_uuid set default nextval('orders22_uuid_seq'::regclass);

alter table orders22 add primary key (id);
alter table orders22 ADD CONSTRAINT orders22_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders22 ADD CONSTRAINT orders22_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders22_created_at ON orders22 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders22_updated_at ON orders22 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders23_id_seq ;
CREATE SEQUENCE orders23_id_seq START 35112864781;
drop SEQUENCE orders23_pub_id_seq ;
CREATE SEQUENCE orders23_pub_id_seq START 35112864781;
drop SEQUENCE orders23_idemp_seq;
CREATE SEQUENCE orders23_idemp_seq START 35112864781;
drop SEQUENCE orders23_uuid_seq ;
CREATE SEQUENCE orders23_uuid_seq START 35112864781;
alter table orders23 alter column id set default nextval('orders23_id_seq'::regclass);
alter table orders23 alter column public_id set default nextval('orders23_pub_id_seq'::regclass);
alter table orders23 alter column idempotency_key set default nextval('orders23_idemp_seq'::regclass);
alter table orders23 alter column orders_uuid set default nextval('orders23_uuid_seq'::regclass);

alter table orders23 add primary key (id);
alter table orders23 ADD CONSTRAINT orders23_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders23 ADD CONSTRAINT orders23_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders23_created_at ON orders23 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders23_updated_at ON orders23 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders24_id_seq ;
CREATE SEQUENCE orders24_id_seq START 35112864781;
drop SEQUENCE orders24_pub_id_seq ;
CREATE SEQUENCE orders24_pub_id_seq START 35112864781;
drop SEQUENCE orders24_idemp_seq;
CREATE SEQUENCE orders24_idemp_seq START 35112864781;
drop SEQUENCE orders24_uuid_seq ;
CREATE SEQUENCE orders24_uuid_seq START 35112864781;
alter table orders24 alter column id set default nextval('orders24_id_seq'::regclass);
alter table orders24 alter column public_id set default nextval('orders24_pub_id_seq'::regclass);
alter table orders24 alter column idempotency_key set default nextval('orders24_idemp_seq'::regclass);
alter table orders24 alter column orders_uuid set default nextval('orders24_uuid_seq'::regclass);

alter table orders24 add primary key (id);
alter table orders24 ADD CONSTRAINT orders24_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders24 ADD CONSTRAINT orders24_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders24_created_at ON orders24 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders24_updated_at ON orders24 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders25_id_seq ;
CREATE SEQUENCE orders25_id_seq START 35112864781;
drop SEQUENCE orders25_pub_id_seq ;
CREATE SEQUENCE orders25_pub_id_seq START 35112864781;
drop SEQUENCE orders25_idemp_seq;
CREATE SEQUENCE orders25_idemp_seq START 35112864781;
drop SEQUENCE orders25_uuid_seq ;
CREATE SEQUENCE orders25_uuid_seq START 35112864781;
alter table orders25 alter column id set default nextval('orders25_id_seq'::regclass);
alter table orders25 alter column public_id set default nextval('orders25_pub_id_seq'::regclass);
alter table orders25 alter column idempotency_key set default nextval('orders25_idemp_seq'::regclass);
alter table orders25 alter column orders_uuid set default nextval('orders25_uuid_seq'::regclass);

alter table orders25 add primary key (id);
alter table orders25 ADD CONSTRAINT orders25_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders25 ADD CONSTRAINT orders25_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders25_created_at ON orders25 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders25_updated_at ON orders25 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders26_id_seq ;
CREATE SEQUENCE orders26_id_seq START 35112864781;
drop SEQUENCE orders26_pub_id_seq ;
CREATE SEQUENCE orders26_pub_id_seq START 35112864781;
drop SEQUENCE orders26_idemp_seq;
CREATE SEQUENCE orders26_idemp_seq START 35112864781;
drop SEQUENCE orders26_uuid_seq ;
CREATE SEQUENCE orders26_uuid_seq START 35112864781;
alter table orders26 alter column id set default nextval('orders26_id_seq'::regclass);
alter table orders26 alter column public_id set default nextval('orders26_pub_id_seq'::regclass);
alter table orders26 alter column idempotency_key set default nextval('orders26_idemp_seq'::regclass);
alter table orders26 alter column orders_uuid set default nextval('orders26_uuid_seq'::regclass);

alter table orders26 add primary key (id);
alter table orders26 ADD CONSTRAINT orders26_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders26 ADD CONSTRAINT orders26_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders26_created_at ON orders26 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders26_updated_at ON orders26 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders27_id_seq ;
CREATE SEQUENCE orders27_id_seq START 35112864781;
drop SEQUENCE orders27_pub_id_seq ;
CREATE SEQUENCE orders27_pub_id_seq START 35112864781;
drop SEQUENCE orders27_idemp_seq;
CREATE SEQUENCE orders27_idemp_seq START 35112864781;
drop SEQUENCE orders27_uuid_seq ;
CREATE SEQUENCE orders27_uuid_seq START 35112864781;
alter table orders27 alter column id set default nextval('orders27_id_seq'::regclass);
alter table orders27 alter column public_id set default nextval('orders27_pub_id_seq'::regclass);
alter table orders27 alter column idempotency_key set default nextval('orders27_idemp_seq'::regclass);
alter table orders27 alter column orders_uuid set default nextval('orders27_uuid_seq'::regclass);

alter table orders27 add primary key (id);
alter table orders27 ADD CONSTRAINT orders27_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders27 ADD CONSTRAINT orders27_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders27_created_at ON orders27 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders27_updated_at ON orders27 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders28_id_seq ;
CREATE SEQUENCE orders28_id_seq START 35112864781;
drop SEQUENCE orders28_pub_id_seq ;
CREATE SEQUENCE orders28_pub_id_seq START 35112864781;
drop SEQUENCE orders28_idemp_seq;
CREATE SEQUENCE orders28_idemp_seq START 35112864781;
drop SEQUENCE orders28_uuid_seq ;
CREATE SEQUENCE orders28_uuid_seq START 35112864781;
alter table orders28 alter column id set default nextval('orders28_id_seq'::regclass);
alter table orders28 alter column public_id set default nextval('orders28_pub_id_seq'::regclass);
alter table orders28 alter column idempotency_key set default nextval('orders28_idemp_seq'::regclass);
alter table orders28 alter column orders_uuid set default nextval('orders28_uuid_seq'::regclass);

alter table orders28 add primary key (id);
alter table orders28 ADD CONSTRAINT orders28_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders28 ADD CONSTRAINT orders28_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders28_created_at ON orders28 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders28_updated_at ON orders28 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders29_id_seq ;
CREATE SEQUENCE orders29_id_seq START 35112864781;
drop SEQUENCE orders29_pub_id_seq ;
CREATE SEQUENCE orders29_pub_id_seq START 35112864781;
drop SEQUENCE orders29_idemp_seq;
CREATE SEQUENCE orders29_idemp_seq START 35112864781;
drop SEQUENCE orders29_uuid_seq ;
CREATE SEQUENCE orders29_uuid_seq START 35112864781;
alter table orders29 alter column id set default nextval('orders29_id_seq'::regclass);
alter table orders29 alter column public_id set default nextval('orders29_pub_id_seq'::regclass);
alter table orders29 alter column idempotency_key set default nextval('orders29_idemp_seq'::regclass);
alter table orders29 alter column orders_uuid set default nextval('orders29_uuid_seq'::regclass);

alter table orders29 add primary key (id);
alter table orders29 ADD CONSTRAINT orders29_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders29 ADD CONSTRAINT orders29_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders29_created_at ON orders29 USING btree (created_at) WITH (fillfactor='90');



drop table orders30 cascade;
create table orders30 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders31 cascade;
create table orders31 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders32 cascade;
create table orders32 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders33 cascade;
create table orders33 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders34 cascade;
create table orders34 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders35 cascade;
create table orders35 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders36 cascade;
create table orders36 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders37 cascade;
create table orders37 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders38 cascade;
create table orders38 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders39 cascade;
create table orders39 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop SEQUENCE orders30_id_seq ;
CREATE SEQUENCE orders30_id_seq START 35112864781;
drop SEQUENCE orders30_pub_id_seq ;
CREATE SEQUENCE orders30_pub_id_seq START 35112864781;
drop SEQUENCE orders30_idemp_seq;
CREATE SEQUENCE orders30_idemp_seq START 35112864781;
drop SEQUENCE orders30_uuid_seq ;
CREATE SEQUENCE orders30_uuid_seq START 35112864781;

alter table orders30 alter column id set default nextval('orders30_id_seq'::regclass);
alter table orders30 alter column public_id set default nextval('orders30_pub_id_seq'::regclass);
alter table orders30 alter column idempotency_key set default nextval('orders30_idemp_seq'::regclass);
alter table orders30 alter column orders_uuid set default nextval('orders30_uuid_seq'::regclass);

alter table orders30 add primary key (id);
alter table orders30 ADD CONSTRAINT orders30_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders30 ADD CONSTRAINT orders30_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders30_created_at ON orders30 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders30_updated_at ON orders30 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders31_id_seq ;
CREATE SEQUENCE orders31_id_seq START 35112864781;
drop SEQUENCE orders31_pub_id_seq ;
CREATE SEQUENCE orders31_pub_id_seq START 35112864781;
drop SEQUENCE orders31_idemp_seq;
CREATE SEQUENCE orders31_idemp_seq START 35112864781;
drop SEQUENCE orders31_uuid_seq ;
CREATE SEQUENCE orders31_uuid_seq START 35112864781;

alter table orders31 alter column id set default nextval('orders31_id_seq'::regclass);
alter table orders31 alter column public_id set default nextval('orders31_pub_id_seq'::regclass);
alter table orders31 alter column idempotency_key set default nextval('orders31_idemp_seq'::regclass);
alter table orders31 alter column orders_uuid set default nextval('orders31_uuid_seq'::regclass);

alter table orders31 add primary key (id);
alter table orders31 ADD CONSTRAINT orders31_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders31 ADD CONSTRAINT orders31_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders31_created_at ON orders31 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders31_updated_at ON orders31 USING btree (updated_at) WITH (fillfactor='90');





drop SEQUENCE orders32_id_seq ;
CREATE SEQUENCE orders32_id_seq START 35112864781;
drop SEQUENCE orders32_pub_id_seq ;
CREATE SEQUENCE orders32_pub_id_seq START 35112864781;
drop SEQUENCE orders32_idemp_seq;
CREATE SEQUENCE orders32_idemp_seq START 35112864781;
drop SEQUENCE orders32_uuid_seq ;
CREATE SEQUENCE orders32_uuid_seq START 35112864781;
alter table orders32 alter column id set default nextval('orders32_id_seq'::regclass);
alter table orders32 alter column public_id set default nextval('orders32_pub_id_seq'::regclass);
alter table orders32 alter column idempotency_key set default nextval('orders32_idemp_seq'::regclass);
alter table orders32 alter column orders_uuid set default nextval('orders32_uuid_seq'::regclass);

alter table orders32 add primary key (id);
alter table orders32 ADD CONSTRAINT orders32_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders32 ADD CONSTRAINT orders32_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders32_created_at ON orders32 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders32_updated_at ON orders32 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders33_id_seq ;
CREATE SEQUENCE orders33_id_seq START 35112864781;
drop SEQUENCE orders33_pub_id_seq ;
CREATE SEQUENCE orders33_pub_id_seq START 35112864781;
drop SEQUENCE orders33_idemp_seq;
CREATE SEQUENCE orders33_idemp_seq START 35112864781;
drop SEQUENCE orders33_uuid_seq ;
CREATE SEQUENCE orders33_uuid_seq START 35112864781;
alter table orders33 alter column id set default nextval('orders33_id_seq'::regclass);
alter table orders33 alter column public_id set default nextval('orders33_pub_id_seq'::regclass);
alter table orders33 alter column idempotency_key set default nextval('orders33_idemp_seq'::regclass);
alter table orders33 alter column orders_uuid set default nextval('orders33_uuid_seq'::regclass);

alter table orders33 add primary key (id);
alter table orders33 ADD CONSTRAINT orders33_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders33 ADD CONSTRAINT orders33_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders33_created_at ON orders33 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders33_updated_at ON orders33 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders34_id_seq ;
CREATE SEQUENCE orders34_id_seq START 35112864781;
drop SEQUENCE orders34_pub_id_seq ;
CREATE SEQUENCE orders34_pub_id_seq START 35112864781;
drop SEQUENCE orders34_idemp_seq;
CREATE SEQUENCE orders34_idemp_seq START 35112864781;
drop SEQUENCE orders34_uuid_seq ;
CREATE SEQUENCE orders34_uuid_seq START 35112864781;
alter table orders34 alter column id set default nextval('orders34_id_seq'::regclass);
alter table orders34 alter column public_id set default nextval('orders34_pub_id_seq'::regclass);
alter table orders34 alter column idempotency_key set default nextval('orders34_idemp_seq'::regclass);
alter table orders34 alter column orders_uuid set default nextval('orders34_uuid_seq'::regclass);

alter table orders34 add primary key (id);
alter table orders34 ADD CONSTRAINT orders34_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders34 ADD CONSTRAINT orders34_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders34_created_at ON orders34 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders34_updated_at ON orders34 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders35_id_seq ;
CREATE SEQUENCE orders35_id_seq START 35112864781;
drop SEQUENCE orders35_pub_id_seq ;
CREATE SEQUENCE orders35_pub_id_seq START 35112864781;
drop SEQUENCE orders35_idemp_seq;
CREATE SEQUENCE orders35_idemp_seq START 35112864781;
drop SEQUENCE orders35_uuid_seq ;
CREATE SEQUENCE orders35_uuid_seq START 35112864781;
alter table orders35 alter column id set default nextval('orders35_id_seq'::regclass);
alter table orders35 alter column public_id set default nextval('orders35_pub_id_seq'::regclass);
alter table orders35 alter column idempotency_key set default nextval('orders35_idemp_seq'::regclass);
alter table orders35 alter column orders_uuid set default nextval('orders35_uuid_seq'::regclass);

alter table orders35 add primary key (id);
alter table orders35 ADD CONSTRAINT orders35_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders35 ADD CONSTRAINT orders35_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders35_created_at ON orders35 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders35_updated_at ON orders35 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders36_id_seq ;
CREATE SEQUENCE orders36_id_seq START 35112864781;
drop SEQUENCE orders36_pub_id_seq ;
CREATE SEQUENCE orders36_pub_id_seq START 35112864781;
drop SEQUENCE orders36_idemp_seq;
CREATE SEQUENCE orders36_idemp_seq START 35112864781;
drop SEQUENCE orders36_uuid_seq ;
CREATE SEQUENCE orders36_uuid_seq START 35112864781;
alter table orders36 alter column id set default nextval('orders36_id_seq'::regclass);
alter table orders36 alter column public_id set default nextval('orders36_pub_id_seq'::regclass);
alter table orders36 alter column idempotency_key set default nextval('orders36_idemp_seq'::regclass);
alter table orders36 alter column orders_uuid set default nextval('orders36_uuid_seq'::regclass);

alter table orders36 add primary key (id);
alter table orders36 ADD CONSTRAINT orders36_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders36 ADD CONSTRAINT orders36_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders36_created_at ON orders36 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders36_updated_at ON orders36 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders37_id_seq ;
CREATE SEQUENCE orders37_id_seq START 35112864781;
drop SEQUENCE orders37_pub_id_seq ;
CREATE SEQUENCE orders37_pub_id_seq START 35112864781;
drop SEQUENCE orders37_idemp_seq;
CREATE SEQUENCE orders37_idemp_seq START 35112864781;
drop SEQUENCE orders37_uuid_seq ;
CREATE SEQUENCE orders37_uuid_seq START 35112864781;
alter table orders37 alter column id set default nextval('orders37_id_seq'::regclass);
alter table orders37 alter column public_id set default nextval('orders37_pub_id_seq'::regclass);
alter table orders37 alter column idempotency_key set default nextval('orders37_idemp_seq'::regclass);
alter table orders37 alter column orders_uuid set default nextval('orders37_uuid_seq'::regclass);

alter table orders37 add primary key (id);
alter table orders37 ADD CONSTRAINT orders37_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders37 ADD CONSTRAINT orders37_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders37_created_at ON orders37 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders37_updated_at ON orders37 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders38_id_seq ;
CREATE SEQUENCE orders38_id_seq START 35112864781;
drop SEQUENCE orders38_pub_id_seq ;
CREATE SEQUENCE orders38_pub_id_seq START 35112864781;
drop SEQUENCE orders38_idemp_seq;
CREATE SEQUENCE orders38_idemp_seq START 35112864781;
drop SEQUENCE orders38_uuid_seq ;
CREATE SEQUENCE orders38_uuid_seq START 35112864781;
alter table orders38 alter column id set default nextval('orders38_id_seq'::regclass);
alter table orders38 alter column public_id set default nextval('orders38_pub_id_seq'::regclass);
alter table orders38 alter column idempotency_key set default nextval('orders38_idemp_seq'::regclass);
alter table orders38 alter column orders_uuid set default nextval('orders38_uuid_seq'::regclass);

alter table orders38 add primary key (id);
alter table orders38 ADD CONSTRAINT orders38_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders38 ADD CONSTRAINT orders38_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders38_created_at ON orders38 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders38_updated_at ON orders38 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders39_id_seq ;
CREATE SEQUENCE orders39_id_seq START 35112864781;
drop SEQUENCE orders39_pub_id_seq ;
CREATE SEQUENCE orders39_pub_id_seq START 35112864781;
drop SEQUENCE orders39_idemp_seq;
CREATE SEQUENCE orders39_idemp_seq START 35112864781;
drop SEQUENCE orders39_uuid_seq ;
CREATE SEQUENCE orders39_uuid_seq START 35112864781;
alter table orders39 alter column id set default nextval('orders39_id_seq'::regclass);
alter table orders39 alter column public_id set default nextval('orders39_pub_id_seq'::regclass);
alter table orders39 alter column idempotency_key set default nextval('orders39_idemp_seq'::regclass);
alter table orders39 alter column orders_uuid set default nextval('orders39_uuid_seq'::regclass);

alter table orders39 add primary key (id);
alter table orders39 ADD CONSTRAINT orders39_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders39 ADD CONSTRAINT orders39_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders39_created_at ON orders39 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders39_updated_at ON orders39 USING btree (updated_at) WITH (fillfactor='90');


drop table orders40 cascade;
create table orders40 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders41 cascade;
create table orders41 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders42 cascade;
create table orders42 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders43 cascade;
create table orders43 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders44 cascade;
create table orders44 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders45 cascade;
create table orders45 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders46 cascade;
create table orders46 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders47 cascade;
create table orders47 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders48 cascade;
create table orders48 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders49 cascade;
create table orders49 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop SEQUENCE orders40_id_seq ;
CREATE SEQUENCE orders40_id_seq START 35112864781;
drop SEQUENCE orders40_pub_id_seq ;
CREATE SEQUENCE orders40_pub_id_seq START 35112864781;
drop SEQUENCE orders40_idemp_seq;
CREATE SEQUENCE orders40_idemp_seq START 35112864781;
drop SEQUENCE orders40_uuid_seq ;
CREATE SEQUENCE orders40_uuid_seq START 35112864781;

alter table orders40 alter column id set default nextval('orders40_id_seq'::regclass);
alter table orders40 alter column public_id set default nextval('orders40_pub_id_seq'::regclass);
alter table orders40 alter column idempotency_key set default nextval('orders40_idemp_seq'::regclass);
alter table orders40 alter column orders_uuid set default nextval('orders40_uuid_seq'::regclass);

alter table orders40 add primary key (id);
alter table orders40 ADD CONSTRAINT orders40_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders40 ADD CONSTRAINT orders40_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders40_created_at ON orders40 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders40_updated_at ON orders40 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders41_id_seq ;
CREATE SEQUENCE orders41_id_seq START 35112864781;
drop SEQUENCE orders41_pub_id_seq ;
CREATE SEQUENCE orders41_pub_id_seq START 35112864781;
drop SEQUENCE orders41_idemp_seq;
CREATE SEQUENCE orders41_idemp_seq START 35112864781;
drop SEQUENCE orders41_uuid_seq ;
CREATE SEQUENCE orders41_uuid_seq START 35112864781;

alter table orders41 alter column id set default nextval('orders41_id_seq'::regclass);
alter table orders41 alter column public_id set default nextval('orders41_pub_id_seq'::regclass);
alter table orders41 alter column idempotency_key set default nextval('orders41_idemp_seq'::regclass);
alter table orders41 alter column orders_uuid set default nextval('orders41_uuid_seq'::regclass);

alter table orders41 add primary key (id);
alter table orders41 ADD CONSTRAINT orders41_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders41 ADD CONSTRAINT orders41_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders41_created_at ON orders41 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders41_updated_at ON orders41 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders42_id_seq ;
CREATE SEQUENCE orders42_id_seq START 35112864781;
drop SEQUENCE orders42_pub_id_seq ;
CREATE SEQUENCE orders42_pub_id_seq START 35112864781;
drop SEQUENCE orders42_idemp_seq;
CREATE SEQUENCE orders42_idemp_seq START 35112864781;
drop SEQUENCE orders42_uuid_seq ;
CREATE SEQUENCE orders42_uuid_seq START 35112864781;
alter table orders42 alter column id set default nextval('orders42_id_seq'::regclass);
alter table orders42 alter column public_id set default nextval('orders42_pub_id_seq'::regclass);
alter table orders42 alter column idempotency_key set default nextval('orders42_idemp_seq'::regclass);
alter table orders42 alter column orders_uuid set default nextval('orders42_uuid_seq'::regclass);

alter table orders42 add primary key (id);
alter table orders42 ADD CONSTRAINT orders42_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders42 ADD CONSTRAINT orders42_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders42_created_at ON orders42 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders42_updated_at ON orders42 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders43_id_seq ;
CREATE SEQUENCE orders43_id_seq START 35112864781;
drop SEQUENCE orders43_pub_id_seq ;
CREATE SEQUENCE orders43_pub_id_seq START 35112864781;
drop SEQUENCE orders43_idemp_seq;
CREATE SEQUENCE orders43_idemp_seq START 35112864781;
drop SEQUENCE orders43_uuid_seq ;
CREATE SEQUENCE orders43_uuid_seq START 35112864781;
alter table orders43 alter column id set default nextval('orders43_id_seq'::regclass);
alter table orders43 alter column public_id set default nextval('orders43_pub_id_seq'::regclass);
alter table orders43 alter column idempotency_key set default nextval('orders43_idemp_seq'::regclass);
alter table orders43 alter column orders_uuid set default nextval('orders43_uuid_seq'::regclass);

alter table orders43 add primary key (id);
alter table orders43 ADD CONSTRAINT orders43_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders43 ADD CONSTRAINT orders43_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders43_created_at ON orders43 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders43_updated_at ON orders43 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders44_id_seq ;
CREATE SEQUENCE orders44_id_seq START 35112864781;
drop SEQUENCE orders44_pub_id_seq ;
CREATE SEQUENCE orders44_pub_id_seq START 35112864781;
drop SEQUENCE orders44_idemp_seq;
CREATE SEQUENCE orders44_idemp_seq START 35112864781;
drop SEQUENCE orders44_uuid_seq ;
CREATE SEQUENCE orders44_uuid_seq START 35112864781;
alter table orders44 alter column id set default nextval('orders44_id_seq'::regclass);
alter table orders44 alter column public_id set default nextval('orders44_pub_id_seq'::regclass);
alter table orders44 alter column idempotency_key set default nextval('orders44_idemp_seq'::regclass);
alter table orders44 alter column orders_uuid set default nextval('orders44_uuid_seq'::regclass);

alter table orders44 add primary key (id);
alter table orders44 ADD CONSTRAINT orders44_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders44 ADD CONSTRAINT orders44_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders44_created_at ON orders44 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders44_updated_at ON orders44 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders45_id_seq ;
CREATE SEQUENCE orders45_id_seq START 35112864781;
drop SEQUENCE orders45_pub_id_seq ;
CREATE SEQUENCE orders45_pub_id_seq START 35112864781;
drop SEQUENCE orders45_idemp_seq;
CREATE SEQUENCE orders45_idemp_seq START 35112864781;
drop SEQUENCE orders45_uuid_seq ;
CREATE SEQUENCE orders45_uuid_seq START 35112864781;
alter table orders45 alter column id set default nextval('orders45_id_seq'::regclass);
alter table orders45 alter column public_id set default nextval('orders45_pub_id_seq'::regclass);
alter table orders45 alter column idempotency_key set default nextval('orders45_idemp_seq'::regclass);
alter table orders45 alter column orders_uuid set default nextval('orders45_uuid_seq'::regclass);

alter table orders45 add primary key (id);
alter table orders45 ADD CONSTRAINT orders45_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders45 ADD CONSTRAINT orders45_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders45_created_at ON orders45 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders45_updated_at ON orders45 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders46_id_seq ;
CREATE SEQUENCE orders46_id_seq START 35112864781;
drop SEQUENCE orders46_pub_id_seq ;
CREATE SEQUENCE orders46_pub_id_seq START 35112864781;
drop SEQUENCE orders46_idemp_seq;
CREATE SEQUENCE orders46_idemp_seq START 35112864781;
drop SEQUENCE orders46_uuid_seq ;
CREATE SEQUENCE orders46_uuid_seq START 35112864781;
alter table orders46 alter column id set default nextval('orders46_id_seq'::regclass);
alter table orders46 alter column public_id set default nextval('orders46_pub_id_seq'::regclass);
alter table orders46 alter column idempotency_key set default nextval('orders46_idemp_seq'::regclass);
alter table orders46 alter column orders_uuid set default nextval('orders46_uuid_seq'::regclass);

alter table orders46 add primary key (id);
alter table orders46 ADD CONSTRAINT orders46_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders46 ADD CONSTRAINT orders46_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders46_created_at ON orders46 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders46_updated_at ON orders46 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders47_id_seq ;
CREATE SEQUENCE orders47_id_seq START 35112864781;
drop SEQUENCE orders47_pub_id_seq ;
CREATE SEQUENCE orders47_pub_id_seq START 35112864781;
drop SEQUENCE orders47_idemp_seq;
CREATE SEQUENCE orders47_idemp_seq START 35112864781;
drop SEQUENCE orders47_uuid_seq ;
CREATE SEQUENCE orders47_uuid_seq START 35112864781;
alter table orders47 alter column id set default nextval('orders47_id_seq'::regclass);
alter table orders47 alter column public_id set default nextval('orders47_pub_id_seq'::regclass);
alter table orders47 alter column idempotency_key set default nextval('orders47_idemp_seq'::regclass);
alter table orders47 alter column orders_uuid set default nextval('orders47_uuid_seq'::regclass);

alter table orders47 add primary key (id);
alter table orders47 ADD CONSTRAINT orders47_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders47 ADD CONSTRAINT orders47_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders47_created_at ON orders47 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders47_updated_at ON orders47 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders48_id_seq ;
CREATE SEQUENCE orders48_id_seq START 35112864781;
drop SEQUENCE orders48_pub_id_seq ;
CREATE SEQUENCE orders48_pub_id_seq START 35112864781;
drop SEQUENCE orders48_idemp_seq;
CREATE SEQUENCE orders48_idemp_seq START 35112864781;
drop SEQUENCE orders48_uuid_seq ;
CREATE SEQUENCE orders48_uuid_seq START 35112864781;
alter table orders48 alter column id set default nextval('orders48_id_seq'::regclass);
alter table orders48 alter column public_id set default nextval('orders48_pub_id_seq'::regclass);
alter table orders48 alter column idempotency_key set default nextval('orders48_idemp_seq'::regclass);
alter table orders48 alter column orders_uuid set default nextval('orders48_uuid_seq'::regclass);

alter table orders48 add primary key (id);
alter table orders48 ADD CONSTRAINT orders48_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders48 ADD CONSTRAINT orders48_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders48_created_at ON orders48 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders48_updated_at ON orders48 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders49_id_seq ;
CREATE SEQUENCE orders49_id_seq START 35112864781;
drop SEQUENCE orders49_pub_id_seq ;
CREATE SEQUENCE orders49_pub_id_seq START 35112864781;
drop SEQUENCE orders49_idemp_seq;
CREATE SEQUENCE orders49_idemp_seq START 35112864781;
drop SEQUENCE orders49_uuid_seq ;
CREATE SEQUENCE orders49_uuid_seq START 35112864781;
alter table orders49 alter column id set default nextval('orders49_id_seq'::regclass);
alter table orders49 alter column public_id set default nextval('orders49_pub_id_seq'::regclass);
alter table orders49 alter column idempotency_key set default nextval('orders49_idemp_seq'::regclass);
alter table orders49 alter column orders_uuid set default nextval('orders49_uuid_seq'::regclass);

alter table orders49 add primary key (id);
alter table orders49 ADD CONSTRAINT orders49_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders49 ADD CONSTRAINT orders49_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders49_created_at ON orders49 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders49_updated_at ON orders49 USING btree (updated_at) WITH (fillfactor='90');


drop table orders50 cascade;
create table orders50 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders51 cascade;
create table orders51 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders52 cascade;
create table orders52 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders53 cascade;
create table orders53 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders54 cascade;
create table orders54 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders55 cascade;
create table orders55 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders56 cascade;
create table orders56 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders57 cascade;
create table orders57 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders58 cascade;
create table orders58 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders59 cascade;
create table orders59 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop SEQUENCE orders50_id_seq ;
CREATE SEQUENCE orders50_id_seq START 35112864781;
drop SEQUENCE orders50_pub_id_seq ;
CREATE SEQUENCE orders50_pub_id_seq START 35112864781;
drop SEQUENCE orders50_idemp_seq;
CREATE SEQUENCE orders50_idemp_seq START 35112864781;
drop SEQUENCE orders50_uuid_seq ;
CREATE SEQUENCE orders50_uuid_seq START 35112864781;

alter table orders50 alter column id set default nextval('orders50_id_seq'::regclass);
alter table orders50 alter column public_id set default nextval('orders50_pub_id_seq'::regclass);
alter table orders50 alter column idempotency_key set default nextval('orders50_idemp_seq'::regclass);
alter table orders50 alter column orders_uuid set default nextval('orders50_uuid_seq'::regclass);

alter table orders50 add primary key (id);
alter table orders50 ADD CONSTRAINT orders50_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders50 ADD CONSTRAINT orders50_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders50_created_at ON orders50 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders50_updated_at ON orders50 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders51_id_seq ;
CREATE SEQUENCE orders51_id_seq START 35112864781;
drop SEQUENCE orders51_pub_id_seq ;
CREATE SEQUENCE orders51_pub_id_seq START 35112864781;
drop SEQUENCE orders51_idemp_seq;
CREATE SEQUENCE orders51_idemp_seq START 35112864781;
drop SEQUENCE orders51_uuid_seq ;
CREATE SEQUENCE orders51_uuid_seq START 35112864781;

alter table orders51 alter column id set default nextval('orders51_id_seq'::regclass);
alter table orders51 alter column public_id set default nextval('orders51_pub_id_seq'::regclass);
alter table orders51 alter column idempotency_key set default nextval('orders51_idemp_seq'::regclass);
alter table orders51 alter column orders_uuid set default nextval('orders51_uuid_seq'::regclass);

alter table orders51 add primary key (id);
alter table orders51 ADD CONSTRAINT orders51_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders51 ADD CONSTRAINT orders51_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders51_created_at ON orders51 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders51_updated_at ON orders51 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders52_id_seq ;
CREATE SEQUENCE orders52_id_seq START 35112864781;
drop SEQUENCE orders52_pub_id_seq ;
CREATE SEQUENCE orders52_pub_id_seq START 35112864781;
drop SEQUENCE orders52_idemp_seq;
CREATE SEQUENCE orders52_idemp_seq START 35112864781;
drop SEQUENCE orders52_uuid_seq ;
CREATE SEQUENCE orders52_uuid_seq START 35112864781;
alter table orders52 alter column id set default nextval('orders52_id_seq'::regclass);
alter table orders52 alter column public_id set default nextval('orders52_pub_id_seq'::regclass);
alter table orders52 alter column idempotency_key set default nextval('orders52_idemp_seq'::regclass);
alter table orders52 alter column orders_uuid set default nextval('orders52_uuid_seq'::regclass);

alter table orders52 add primary key (id);
alter table orders52 ADD CONSTRAINT orders52_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders52 ADD CONSTRAINT orders52_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders52_created_at ON orders52 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders52_updated_at ON orders52 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders53_id_seq ;
CREATE SEQUENCE orders53_id_seq START 35112864781;
drop SEQUENCE orders53_pub_id_seq ;
CREATE SEQUENCE orders53_pub_id_seq START 35112864781;
drop SEQUENCE orders53_idemp_seq;
CREATE SEQUENCE orders53_idemp_seq START 35112864781;
drop SEQUENCE orders53_uuid_seq ;
CREATE SEQUENCE orders53_uuid_seq START 35112864781;
alter table orders53 alter column id set default nextval('orders53_id_seq'::regclass);
alter table orders53 alter column public_id set default nextval('orders53_pub_id_seq'::regclass);
alter table orders53 alter column idempotency_key set default nextval('orders53_idemp_seq'::regclass);
alter table orders53 alter column orders_uuid set default nextval('orders53_uuid_seq'::regclass);

alter table orders53 add primary key (id);
alter table orders53 ADD CONSTRAINT orders53_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders53 ADD CONSTRAINT orders53_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders53_created_at ON orders53 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders53_updated_at ON orders53 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders54_id_seq ;
CREATE SEQUENCE orders54_id_seq START 35112864781;
drop SEQUENCE orders54_pub_id_seq ;
CREATE SEQUENCE orders54_pub_id_seq START 35112864781;
drop SEQUENCE orders54_idemp_seq;
CREATE SEQUENCE orders54_idemp_seq START 35112864781;
drop SEQUENCE orders54_uuid_seq ;
CREATE SEQUENCE orders54_uuid_seq START 35112864781;
alter table orders54 alter column id set default nextval('orders54_id_seq'::regclass);
alter table orders54 alter column public_id set default nextval('orders54_pub_id_seq'::regclass);
alter table orders54 alter column idempotency_key set default nextval('orders54_idemp_seq'::regclass);
alter table orders54 alter column orders_uuid set default nextval('orders54_uuid_seq'::regclass);

alter table orders54 add primary key (id);
alter table orders54 ADD CONSTRAINT orders54_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders54 ADD CONSTRAINT orders54_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders54_created_at ON orders54 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders54_updated_at ON orders54 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders55_id_seq ;
CREATE SEQUENCE orders55_id_seq START 35112864781;
drop SEQUENCE orders55_pub_id_seq ;
CREATE SEQUENCE orders55_pub_id_seq START 35112864781;
drop SEQUENCE orders55_idemp_seq;
CREATE SEQUENCE orders55_idemp_seq START 35112864781;
drop SEQUENCE orders55_uuid_seq ;
CREATE SEQUENCE orders55_uuid_seq START 35112864781;
alter table orders55 alter column id set default nextval('orders55_id_seq'::regclass);
alter table orders55 alter column public_id set default nextval('orders55_pub_id_seq'::regclass);
alter table orders55 alter column idempotency_key set default nextval('orders55_idemp_seq'::regclass);
alter table orders55 alter column orders_uuid set default nextval('orders55_uuid_seq'::regclass);

alter table orders55 add primary key (id);
alter table orders55 ADD CONSTRAINT orders55_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders55 ADD CONSTRAINT orders55_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders55_created_at ON orders55 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders55_updated_at ON orders55 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders56_id_seq ;
CREATE SEQUENCE orders56_id_seq START 35112864781;
drop SEQUENCE orders56_pub_id_seq ;
CREATE SEQUENCE orders56_pub_id_seq START 35112864781;
drop SEQUENCE orders56_idemp_seq;
CREATE SEQUENCE orders56_idemp_seq START 35112864781;
drop SEQUENCE orders56_uuid_seq ;
CREATE SEQUENCE orders56_uuid_seq START 35112864781;
alter table orders56 alter column id set default nextval('orders56_id_seq'::regclass);
alter table orders56 alter column public_id set default nextval('orders56_pub_id_seq'::regclass);
alter table orders56 alter column idempotency_key set default nextval('orders56_idemp_seq'::regclass);
alter table orders56 alter column orders_uuid set default nextval('orders56_uuid_seq'::regclass);

alter table orders56 add primary key (id);
alter table orders56 ADD CONSTRAINT orders56_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders56 ADD CONSTRAINT orders56_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders56_created_at ON orders56 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders56_updated_at ON orders56 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders57_id_seq ;
CREATE SEQUENCE orders57_id_seq START 35112864781;
drop SEQUENCE orders57_pub_id_seq ;
CREATE SEQUENCE orders57_pub_id_seq START 35112864781;
drop SEQUENCE orders57_idemp_seq;
CREATE SEQUENCE orders57_idemp_seq START 35112864781;
drop SEQUENCE orders57_uuid_seq ;
CREATE SEQUENCE orders57_uuid_seq START 35112864781;
alter table orders57 alter column id set default nextval('orders57_id_seq'::regclass);
alter table orders57 alter column public_id set default nextval('orders57_pub_id_seq'::regclass);
alter table orders57 alter column idempotency_key set default nextval('orders57_idemp_seq'::regclass);
alter table orders57 alter column orders_uuid set default nextval('orders57_uuid_seq'::regclass);

alter table orders57 add primary key (id);
alter table orders57 ADD CONSTRAINT orders57_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders57 ADD CONSTRAINT orders57_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders57_created_at ON orders57 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders57_updated_at ON orders57 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders58_id_seq ;
CREATE SEQUENCE orders58_id_seq START 35112864781;
drop SEQUENCE orders58_pub_id_seq ;
CREATE SEQUENCE orders58_pub_id_seq START 35112864781;
drop SEQUENCE orders58_idemp_seq;
CREATE SEQUENCE orders58_idemp_seq START 35112864781;
drop SEQUENCE orders58_uuid_seq ;
CREATE SEQUENCE orders58_uuid_seq START 35112864781;
alter table orders58 alter column id set default nextval('orders58_id_seq'::regclass);
alter table orders58 alter column public_id set default nextval('orders58_pub_id_seq'::regclass);
alter table orders58 alter column idempotency_key set default nextval('orders58_idemp_seq'::regclass);
alter table orders58 alter column orders_uuid set default nextval('orders58_uuid_seq'::regclass);

alter table orders58 add primary key (id);
alter table orders58 ADD CONSTRAINT orders58_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders58 ADD CONSTRAINT orders58_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders58_created_at ON orders58 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders58_updated_at ON orders58 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders59_id_seq ;
CREATE SEQUENCE orders59_id_seq START 35112864781;
drop SEQUENCE orders59_pub_id_seq ;
CREATE SEQUENCE orders59_pub_id_seq START 35112864781;
drop SEQUENCE orders59_idemp_seq;
CREATE SEQUENCE orders59_idemp_seq START 35112864781;
drop SEQUENCE orders59_uuid_seq ;
CREATE SEQUENCE orders59_uuid_seq START 35112864781;
alter table orders59 alter column id set default nextval('orders59_id_seq'::regclass);
alter table orders59 alter column public_id set default nextval('orders59_pub_id_seq'::regclass);
alter table orders59 alter column idempotency_key set default nextval('orders59_idemp_seq'::regclass);
alter table orders59 alter column orders_uuid set default nextval('orders59_uuid_seq'::regclass);

alter table orders59 add primary key (id);
alter table orders59 ADD CONSTRAINT orders59_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders59 ADD CONSTRAINT orders59_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders59_created_at ON orders59 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders59_updated_at ON orders59 USING btree (updated_at) WITH (fillfactor='90');


drop table orders60 cascade;
create table orders60 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders61 cascade;
create table orders61 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders62 cascade;
create table orders62 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders63 cascade;
create table orders63 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders64 cascade;
create table orders64 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders65 cascade;
create table orders65 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders66 cascade;
create table orders66 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders67 cascade;
create table orders67 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders68 cascade;
create table orders68 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders69 cascade;
create table orders69 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop SEQUENCE orders60_id_seq ;
CREATE SEQUENCE orders60_id_seq START 35112864781;
drop SEQUENCE orders60_pub_id_seq ;
CREATE SEQUENCE orders60_pub_id_seq START 35112864781;
drop SEQUENCE orders60_idemp_seq;
CREATE SEQUENCE orders60_idemp_seq START 35112864781;
drop SEQUENCE orders60_uuid_seq ;
CREATE SEQUENCE orders60_uuid_seq START 35112864781;

alter table orders60 alter column id set default nextval('orders60_id_seq'::regclass);
alter table orders60 alter column public_id set default nextval('orders60_pub_id_seq'::regclass);
alter table orders60 alter column idempotency_key set default nextval('orders60_idemp_seq'::regclass);
alter table orders60 alter column orders_uuid set default nextval('orders60_uuid_seq'::regclass);

alter table orders60 add primary key (id);
alter table orders60 ADD CONSTRAINT orders60_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders60 ADD CONSTRAINT orders60_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders60_created_at ON orders60 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders60_updated_at ON orders60 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders61_id_seq ;
CREATE SEQUENCE orders61_id_seq START 35112864781;
drop SEQUENCE orders61_pub_id_seq ;
CREATE SEQUENCE orders61_pub_id_seq START 35112864781;
drop SEQUENCE orders61_idemp_seq;
CREATE SEQUENCE orders61_idemp_seq START 35112864781;
drop SEQUENCE orders61_uuid_seq ;
CREATE SEQUENCE orders61_uuid_seq START 35112864781;

alter table orders61 alter column id set default nextval('orders61_id_seq'::regclass);
alter table orders61 alter column public_id set default nextval('orders61_pub_id_seq'::regclass);
alter table orders61 alter column idempotency_key set default nextval('orders61_idemp_seq'::regclass);
alter table orders61 alter column orders_uuid set default nextval('orders61_uuid_seq'::regclass);

alter table orders61 add primary key (id);
alter table orders61 ADD CONSTRAINT orders61_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders61 ADD CONSTRAINT orders61_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders61_created_at ON orders61 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders61_updated_at ON orders61 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders62_id_seq ;
CREATE SEQUENCE orders62_id_seq START 35112864781;
drop SEQUENCE orders62_pub_id_seq ;
CREATE SEQUENCE orders62_pub_id_seq START 35112864781;
drop SEQUENCE orders62_idemp_seq;
CREATE SEQUENCE orders62_idemp_seq START 35112864781;
drop SEQUENCE orders62_uuid_seq ;
CREATE SEQUENCE orders62_uuid_seq START 35112864781;
alter table orders62 alter column id set default nextval('orders62_id_seq'::regclass);
alter table orders62 alter column public_id set default nextval('orders62_pub_id_seq'::regclass);
alter table orders62 alter column idempotency_key set default nextval('orders62_idemp_seq'::regclass);
alter table orders62 alter column orders_uuid set default nextval('orders62_uuid_seq'::regclass);

alter table orders62 add primary key (id);
alter table orders62 ADD CONSTRAINT orders62_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders62 ADD CONSTRAINT orders62_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders62_created_at ON orders62 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders62_updated_at ON orders62 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders63_id_seq ;
CREATE SEQUENCE orders63_id_seq START 35112864781;
drop SEQUENCE orders63_pub_id_seq ;
CREATE SEQUENCE orders63_pub_id_seq START 35112864781;
drop SEQUENCE orders63_idemp_seq;
CREATE SEQUENCE orders63_idemp_seq START 35112864781;
drop SEQUENCE orders63_uuid_seq ;
CREATE SEQUENCE orders63_uuid_seq START 35112864781;
alter table orders63 alter column id set default nextval('orders63_id_seq'::regclass);
alter table orders63 alter column public_id set default nextval('orders63_pub_id_seq'::regclass);
alter table orders63 alter column idempotency_key set default nextval('orders63_idemp_seq'::regclass);
alter table orders63 alter column orders_uuid set default nextval('orders63_uuid_seq'::regclass);

alter table orders63 add primary key (id);
alter table orders63 ADD CONSTRAINT orders63_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders63 ADD CONSTRAINT orders63_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders63_created_at ON orders63 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders63_updated_at ON orders63 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders64_id_seq ;
CREATE SEQUENCE orders64_id_seq START 35112864781;
drop SEQUENCE orders64_pub_id_seq ;
CREATE SEQUENCE orders64_pub_id_seq START 35112864781;
drop SEQUENCE orders64_idemp_seq;
CREATE SEQUENCE orders64_idemp_seq START 35112864781;
drop SEQUENCE orders64_uuid_seq ;
CREATE SEQUENCE orders64_uuid_seq START 35112864781;
alter table orders64 alter column id set default nextval('orders64_id_seq'::regclass);
alter table orders64 alter column public_id set default nextval('orders64_pub_id_seq'::regclass);
alter table orders64 alter column idempotency_key set default nextval('orders64_idemp_seq'::regclass);
alter table orders64 alter column orders_uuid set default nextval('orders64_uuid_seq'::regclass);

alter table orders64 add primary key (id);
alter table orders64 ADD CONSTRAINT orders64_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders64 ADD CONSTRAINT orders64_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders64_created_at ON orders64 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders64_updated_at ON orders64 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders65_id_seq ;
CREATE SEQUENCE orders65_id_seq START 35112864781;
drop SEQUENCE orders65_pub_id_seq ;
CREATE SEQUENCE orders65_pub_id_seq START 35112864781;
drop SEQUENCE orders65_idemp_seq;
CREATE SEQUENCE orders65_idemp_seq START 35112864781;
drop SEQUENCE orders65_uuid_seq ;
CREATE SEQUENCE orders65_uuid_seq START 35112864781;
alter table orders65 alter column id set default nextval('orders65_id_seq'::regclass);
alter table orders65 alter column public_id set default nextval('orders65_pub_id_seq'::regclass);
alter table orders65 alter column idempotency_key set default nextval('orders65_idemp_seq'::regclass);
alter table orders65 alter column orders_uuid set default nextval('orders65_uuid_seq'::regclass);

alter table orders65 add primary key (id);
alter table orders65 ADD CONSTRAINT orders65_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders65 ADD CONSTRAINT orders65_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders65_created_at ON orders65 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders65_updated_at ON orders65 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders66_id_seq ;
CREATE SEQUENCE orders66_id_seq START 35112864781;
drop SEQUENCE orders66_pub_id_seq ;
CREATE SEQUENCE orders66_pub_id_seq START 35112864781;
drop SEQUENCE orders66_idemp_seq;
CREATE SEQUENCE orders66_idemp_seq START 35112864781;
drop SEQUENCE orders66_uuid_seq ;
CREATE SEQUENCE orders66_uuid_seq START 35112864781;
alter table orders66 alter column id set default nextval('orders66_id_seq'::regclass);
alter table orders66 alter column public_id set default nextval('orders66_pub_id_seq'::regclass);
alter table orders66 alter column idempotency_key set default nextval('orders66_idemp_seq'::regclass);
alter table orders66 alter column orders_uuid set default nextval('orders66_uuid_seq'::regclass);

alter table orders66 add primary key (id);
alter table orders66 ADD CONSTRAINT orders66_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders66 ADD CONSTRAINT orders66_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders66_created_at ON orders66 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders66_updated_at ON orders66 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders67_id_seq ;
CREATE SEQUENCE orders67_id_seq START 35112864781;
drop SEQUENCE orders67_pub_id_seq ;
CREATE SEQUENCE orders67_pub_id_seq START 35112864781;
drop SEQUENCE orders67_idemp_seq;
CREATE SEQUENCE orders67_idemp_seq START 35112864781;
drop SEQUENCE orders67_uuid_seq ;
CREATE SEQUENCE orders67_uuid_seq START 35112864781;
alter table orders67 alter column id set default nextval('orders67_id_seq'::regclass);
alter table orders67 alter column public_id set default nextval('orders67_pub_id_seq'::regclass);
alter table orders67 alter column idempotency_key set default nextval('orders67_idemp_seq'::regclass);
alter table orders67 alter column orders_uuid set default nextval('orders67_uuid_seq'::regclass);

alter table orders67 add primary key (id);
alter table orders67 ADD CONSTRAINT orders67_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders67 ADD CONSTRAINT orders67_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders67_created_at ON orders67 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders67_updated_at ON orders67 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders68_id_seq ;
CREATE SEQUENCE orders68_id_seq START 35112864781;
drop SEQUENCE orders68_pub_id_seq ;
CREATE SEQUENCE orders68_pub_id_seq START 35112864781;
drop SEQUENCE orders68_idemp_seq;
CREATE SEQUENCE orders68_idemp_seq START 35112864781;
drop SEQUENCE orders68_uuid_seq ;
CREATE SEQUENCE orders68_uuid_seq START 35112864781;
alter table orders68 alter column id set default nextval('orders68_id_seq'::regclass);
alter table orders68 alter column public_id set default nextval('orders68_pub_id_seq'::regclass);
alter table orders68 alter column idempotency_key set default nextval('orders68_idemp_seq'::regclass);
alter table orders68 alter column orders_uuid set default nextval('orders68_uuid_seq'::regclass);

alter table orders68 add primary key (id);
alter table orders68 ADD CONSTRAINT orders68_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders68 ADD CONSTRAINT orders68_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders68_created_at ON orders68 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders68_updated_at ON orders68 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders69_id_seq ;
CREATE SEQUENCE orders69_id_seq START 35112864781;
drop SEQUENCE orders69_pub_id_seq ;
CREATE SEQUENCE orders69_pub_id_seq START 35112864781;
drop SEQUENCE orders69_idemp_seq;
CREATE SEQUENCE orders69_idemp_seq START 35112864781;
drop SEQUENCE orders69_uuid_seq ;
CREATE SEQUENCE orders69_uuid_seq START 35112864781;
alter table orders69 alter column id set default nextval('orders69_id_seq'::regclass);
alter table orders69 alter column public_id set default nextval('orders69_pub_id_seq'::regclass);
alter table orders69 alter column idempotency_key set default nextval('orders69_idemp_seq'::regclass);
alter table orders69 alter column orders_uuid set default nextval('orders69_uuid_seq'::regclass);

alter table orders69 add primary key (id);
alter table orders69 ADD CONSTRAINT orders69_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders69 ADD CONSTRAINT orders69_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders69_created_at ON orders69 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders69_updated_at ON orders69 USING btree (updated_at) WITH (fillfactor='90');


drop table orders70 cascade;
create table orders70 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders71 cascade;
create table orders71 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders72 cascade;
create table orders72 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders73 cascade;
create table orders73 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders74 cascade;
create table orders74 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders75 cascade;
create table orders75 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders76 cascade;
create table orders76 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders77 cascade;
create table orders77 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders78 cascade;
create table orders78 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop table orders79 cascade;
create table orders79 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

drop SEQUENCE orders70_id_seq ;
CREATE SEQUENCE orders70_id_seq START 35112864781;
drop SEQUENCE orders70_pub_id_seq ;
CREATE SEQUENCE orders70_pub_id_seq START 35112864781;
drop SEQUENCE orders70_idemp_seq;
CREATE SEQUENCE orders70_idemp_seq START 35112864781;
drop SEQUENCE orders70_uuid_seq ;
CREATE SEQUENCE orders70_uuid_seq START 35112864781;

alter table orders70 alter column id set default nextval('orders70_id_seq'::regclass);
alter table orders70 alter column public_id set default nextval('orders70_pub_id_seq'::regclass);
alter table orders70 alter column idempotency_key set default nextval('orders70_idemp_seq'::regclass);
alter table orders70 alter column orders_uuid set default nextval('orders70_uuid_seq'::regclass);

alter table orders70 add primary key (id);
alter table orders70 ADD CONSTRAINT orders70_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders70 ADD CONSTRAINT orders70_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders70_created_at ON orders70 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders70_updated_at ON orders70 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders71_id_seq ;
CREATE SEQUENCE orders71_id_seq START 35112864781;
drop SEQUENCE orders71_pub_id_seq ;
CREATE SEQUENCE orders71_pub_id_seq START 35112864781;
drop SEQUENCE orders71_idemp_seq;
CREATE SEQUENCE orders71_idemp_seq START 35112864781;
drop SEQUENCE orders71_uuid_seq ;
CREATE SEQUENCE orders71_uuid_seq START 35112864781;

alter table orders71 alter column id set default nextval('orders71_id_seq'::regclass);
alter table orders71 alter column public_id set default nextval('orders71_pub_id_seq'::regclass);
alter table orders71 alter column idempotency_key set default nextval('orders71_idemp_seq'::regclass);
alter table orders71 alter column orders_uuid set default nextval('orders71_uuid_seq'::regclass);

alter table orders71 add primary key (id);
alter table orders71 ADD CONSTRAINT orders71_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders71 ADD CONSTRAINT orders71_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders71_created_at ON orders71 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders71_updated_at ON orders71 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders72_id_seq ;
CREATE SEQUENCE orders72_id_seq START 35112864781;
drop SEQUENCE orders72_pub_id_seq ;
CREATE SEQUENCE orders72_pub_id_seq START 35112864781;
drop SEQUENCE orders72_idemp_seq;
CREATE SEQUENCE orders72_idemp_seq START 35112864781;
drop SEQUENCE orders72_uuid_seq ;
CREATE SEQUENCE orders72_uuid_seq START 35112864781;
alter table orders72 alter column id set default nextval('orders72_id_seq'::regclass);
alter table orders72 alter column public_id set default nextval('orders72_pub_id_seq'::regclass);
alter table orders72 alter column idempotency_key set default nextval('orders72_idemp_seq'::regclass);
alter table orders72 alter column orders_uuid set default nextval('orders72_uuid_seq'::regclass);

alter table orders72 add primary key (id);
alter table orders72 ADD CONSTRAINT orders72_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders72 ADD CONSTRAINT orders72_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders72_created_at ON orders72 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders72_updated_at ON orders72 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders73_id_seq ;
CREATE SEQUENCE orders73_id_seq START 35112864781;
drop SEQUENCE orders73_pub_id_seq ;
CREATE SEQUENCE orders73_pub_id_seq START 35112864781;
drop SEQUENCE orders73_idemp_seq;
CREATE SEQUENCE orders73_idemp_seq START 35112864781;
drop SEQUENCE orders73_uuid_seq ;
CREATE SEQUENCE orders73_uuid_seq START 35112864781;
alter table orders73 alter column id set default nextval('orders73_id_seq'::regclass);
alter table orders73 alter column public_id set default nextval('orders73_pub_id_seq'::regclass);
alter table orders73 alter column idempotency_key set default nextval('orders73_idemp_seq'::regclass);
alter table orders73 alter column orders_uuid set default nextval('orders73_uuid_seq'::regclass);

alter table orders73 add primary key (id);
alter table orders73 ADD CONSTRAINT orders73_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders73 ADD CONSTRAINT orders73_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders73_created_at ON orders73 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders73_updated_at ON orders73 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders74_id_seq ;
CREATE SEQUENCE orders74_id_seq START 35112864781;
drop SEQUENCE orders74_pub_id_seq ;
CREATE SEQUENCE orders74_pub_id_seq START 35112864781;
drop SEQUENCE orders74_idemp_seq;
CREATE SEQUENCE orders74_idemp_seq START 35112864781;
drop SEQUENCE orders74_uuid_seq ;
CREATE SEQUENCE orders74_uuid_seq START 35112864781;
alter table orders74 alter column id set default nextval('orders74_id_seq'::regclass);
alter table orders74 alter column public_id set default nextval('orders74_pub_id_seq'::regclass);
alter table orders74 alter column idempotency_key set default nextval('orders74_idemp_seq'::regclass);
alter table orders74 alter column orders_uuid set default nextval('orders74_uuid_seq'::regclass);

alter table orders74 add primary key (id);
alter table orders74 ADD CONSTRAINT orders74_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders74 ADD CONSTRAINT orders74_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders74_created_at ON orders74 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders74_updated_at ON orders74 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders75_id_seq ;
CREATE SEQUENCE orders75_id_seq START 35112864781;
drop SEQUENCE orders75_pub_id_seq ;
CREATE SEQUENCE orders75_pub_id_seq START 35112864781;
drop SEQUENCE orders75_idemp_seq;
CREATE SEQUENCE orders75_idemp_seq START 35112864781;
drop SEQUENCE orders75_uuid_seq ;
CREATE SEQUENCE orders75_uuid_seq START 35112864781;
alter table orders75 alter column id set default nextval('orders75_id_seq'::regclass);
alter table orders75 alter column public_id set default nextval('orders75_pub_id_seq'::regclass);
alter table orders75 alter column idempotency_key set default nextval('orders75_idemp_seq'::regclass);
alter table orders75 alter column orders_uuid set default nextval('orders75_uuid_seq'::regclass);

alter table orders75 add primary key (id);
alter table orders75 ADD CONSTRAINT orders75_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders75 ADD CONSTRAINT orders75_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders75_created_at ON orders75 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders75_updated_at ON orders75 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders76_id_seq ;
CREATE SEQUENCE orders76_id_seq START 35112864781;
drop SEQUENCE orders76_pub_id_seq ;
CREATE SEQUENCE orders76_pub_id_seq START 35112864781;
drop SEQUENCE orders76_idemp_seq;
CREATE SEQUENCE orders76_idemp_seq START 35112864781;
drop SEQUENCE orders76_uuid_seq ;
CREATE SEQUENCE orders76_uuid_seq START 35112864781;
alter table orders76 alter column id set default nextval('orders76_id_seq'::regclass);
alter table orders76 alter column public_id set default nextval('orders76_pub_id_seq'::regclass);
alter table orders76 alter column idempotency_key set default nextval('orders76_idemp_seq'::regclass);
alter table orders76 alter column orders_uuid set default nextval('orders76_uuid_seq'::regclass);

alter table orders76 add primary key (id);
alter table orders76 ADD CONSTRAINT orders76_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders76 ADD CONSTRAINT orders76_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders76_created_at ON orders76 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders76_updated_at ON orders76 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders77_id_seq ;
CREATE SEQUENCE orders77_id_seq START 35112864781;
drop SEQUENCE orders77_pub_id_seq ;
CREATE SEQUENCE orders77_pub_id_seq START 35112864781;
drop SEQUENCE orders77_idemp_seq;
CREATE SEQUENCE orders77_idemp_seq START 35112864781;
drop SEQUENCE orders77_uuid_seq ;
CREATE SEQUENCE orders77_uuid_seq START 35112864781;
alter table orders77 alter column id set default nextval('orders77_id_seq'::regclass);
alter table orders77 alter column public_id set default nextval('orders77_pub_id_seq'::regclass);
alter table orders77 alter column idempotency_key set default nextval('orders77_idemp_seq'::regclass);
alter table orders77 alter column orders_uuid set default nextval('orders77_uuid_seq'::regclass);

alter table orders77 add primary key (id);
alter table orders77 ADD CONSTRAINT orders77_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders77 ADD CONSTRAINT orders77_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders77_created_at ON orders77 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders77_updated_at ON orders77 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders78_id_seq ;
CREATE SEQUENCE orders78_id_seq START 35112864781;
drop SEQUENCE orders78_pub_id_seq ;
CREATE SEQUENCE orders78_pub_id_seq START 35112864781;
drop SEQUENCE orders78_idemp_seq;
CREATE SEQUENCE orders78_idemp_seq START 35112864781;
drop SEQUENCE orders78_uuid_seq ;
CREATE SEQUENCE orders78_uuid_seq START 35112864781;
alter table orders78 alter column id set default nextval('orders78_id_seq'::regclass);
alter table orders78 alter column public_id set default nextval('orders78_pub_id_seq'::regclass);
alter table orders78 alter column idempotency_key set default nextval('orders78_idemp_seq'::regclass);
alter table orders78 alter column orders_uuid set default nextval('orders78_uuid_seq'::regclass);

alter table orders78 add primary key (id);
alter table orders78 ADD CONSTRAINT orders78_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders78 ADD CONSTRAINT orders78_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders78_created_at ON orders78 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders78_updated_at ON orders78 USING btree (updated_at) WITH (fillfactor='90');

drop SEQUENCE orders79_id_seq ;
CREATE SEQUENCE orders79_id_seq START 35112864781;
drop SEQUENCE orders79_pub_id_seq ;
CREATE SEQUENCE orders79_pub_id_seq START 35112864781;
drop SEQUENCE orders79_idemp_seq;
CREATE SEQUENCE orders79_idemp_seq START 35112864781;
drop SEQUENCE orders79_uuid_seq ;
CREATE SEQUENCE orders79_uuid_seq START 35112864781;
alter table orders79 alter column id set default nextval('orders79_id_seq'::regclass);
alter table orders79 alter column public_id set default nextval('orders79_pub_id_seq'::regclass);
alter table orders79 alter column idempotency_key set default nextval('orders79_idemp_seq'::regclass);
alter table orders79 alter column orders_uuid set default nextval('orders79_uuid_seq'::regclass);

alter table orders79 add primary key (id);
alter table orders79 ADD CONSTRAINT orders79_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
ALTER TABLE orders79 ADD CONSTRAINT orders79_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
CREATE INDEX orders79_created_at ON orders79 USING btree (created_at) WITH (fillfactor='90');
CREATE INDEX orders79_updated_at ON orders79 USING btree (updated_at) WITH (fillfactor='90');
