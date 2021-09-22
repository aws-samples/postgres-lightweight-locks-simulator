insert into orders103
select
        nextval('orders39_id_seq'),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25),
        substr(md5(random()::text), 0, 25);
\sleep 20 ms
