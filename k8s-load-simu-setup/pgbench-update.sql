begin;
update orders100 set col1=substr(md5(random()::text), 0, 25) where id = (select floor(random() * max(id) + 1)::bigint from orders100);
update orders101 set col1=substr(md5(random()::text), 0, 25) where id = (select floor(random() * max(id) + 1)::bigint from orders101);
update orders102 set col1=substr(md5(random()::text), 0, 25) where id = (select floor(random() * max(id) + 1)::bigint from orders102);
update orders103 set col1=substr(md5(random()::text), 0, 25) where id = (select floor(random() * max(id) + 1)::bigint from orders103);
update orders104 set col1=substr(md5(random()::text), 0, 25) where id = (select floor(random() * max(id) + 1)::bigint from orders104);
update orders105 set col1=substr(md5(random()::text), 0, 25) where id = (select floor(random() * max(id) + 1)::bigint from orders105);
commit;
\sleep 20 ms
