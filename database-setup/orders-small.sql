--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint DEFAULT nextval('public.orders_id_seq'::regclass) NOT NULL,
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
    text_notnull_1 text NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders orders_idempotency_created_at_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_idempotency_created_at_key UNIQUE (idempotency_key, created_at) WITH (fillfactor='90');


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders orders_uuid_created_at_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_uuid_created_at_key UNIQUE (orders_uuid, created_at) WITH (fillfactor='90');


--
-- Name: orders_bigint_null1_partial_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_bigint_null1_partial_key ON public.orders USING btree (bigint_nonull_1) WITH (fillfactor='90') WHERE (bigint_nonull_1 IS NOT NULL);


--
-- Name: orders_public_id_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX orders_public_id_created_at_idx ON public.orders USING btree (public_id, created_at);


--
-- Name: orders_public_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX orders_public_id_idx ON public.orders USING btree (public_id);


--
-- Name: orders_ts_null_1_intnull_2_ts_null_2_partial; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_ts_null_1_intnull_2_ts_null_2_partial ON public.orders USING btree (timestamp_null_1, int_notnull_2) WITH (fillfactor='90') WHERE (timestamp_null_1 IS NOT NULL);


--
-- PostgreSQL database dump complete
--

