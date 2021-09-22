CREATE EXTENSION "uuid-ossp";

CREATE TABLE public.orders (
    id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    public_id uuid DEFAULT uuid_generate_v4() NOT NULL,
    idempotency_key uuid DEFAULT uuid_generate_v4() NOT NULL,
    orders_uuid uuid DEFAULT uuid_generate_v4() NOT NULL,
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


create table orders1 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;
create table orders2 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;
create table orders3 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;
create table orders4 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;
create table orders5 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;
create table orders6 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;
create table orders7 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;
create table orders8 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;
create table orders9 as select * from orders where created_at > NOW() - '10 minute'::INTERVAL and created_at < NOW() + '10 minute'::INTERVAL;

