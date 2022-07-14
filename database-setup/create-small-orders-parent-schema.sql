--CREATE SEQUENCE orders_id_seq START 1;
--CREATE SEQUENCE orders_pub_id_seq START 1;
--CREATE SEQUENCE orders_idemp_seq START 1;
--CREATE SEQUENCE orders_uuid_seq START 1;

CREATE TABLE public.orders_parent (
    id bigint DEFAULT nextval('public.orders_id_seq'::regclass),
    public_id bigint DEFAULT nextval('public.orders_pub_id_seq'::regclass) NOT NULL,
    idempotency_key bigint DEFAULT nextval('public.orders_idemp_seq'::regclass) NOT NULL,
    orders_uuid bigint DEFAULT nextval('public.orders_uuid_seq'::regclass) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,

    int_notnull_1 integer NOT NULL,
    int_notnull_2 integer NOT NULL,
    int_notnull_3 integer NOT NULL,
    int_notnull_4 integer NOT NULL,
    int_null_1 integer,
    int_null_2 integer,
    int_null_3 integer,
    bigint_nonull_1 bigint NOT NULL,
    bigint_null_1 bigint,
    timestamp_null_1 timestamp with time zone,
    text_notnull_1 text NOT NULL,
    PRIMARY KEY (public_id,created_at)
) partition by range (created_at);
 
--ALTER TABLE ONLY public.orders ADD CONSTRAINT orders_uuid_created_at_key UNIQUE (orders_uuid,created_at) WITH (fillfactor='90');
--ALTER TABLE ONLY public.orders ADD CONSTRAINT orders_idempotency_created_at_key UNIQUE (idempotency_key,created_at) WITH (fillfactor='90');
 
--CREATE INDEX orders_bigint_null1_partial_key ON public.orders USING btree (bigint_nonull_1) WITH (fillfactor='90') WHERE (bigint_nonull_1 IS NOT NULL);
 
--CREATE INDEX orders_ts_null_1_intnull_2_ts_null_2_partial ON public.orders USING btree (timestamp_null_1, int_notnull_2) WITH (fillfactor='90') WHERE (timestamp_null_1 IS NOT NULL);
