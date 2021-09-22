update orders103 set col1=substr(md5(random()::text), 0, 25) where id = (select floor(random() * max(id) + 1)::bigint from orders100);
\sleep 20 ms
