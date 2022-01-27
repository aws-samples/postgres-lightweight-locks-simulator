# partition procedure

```sql
1/ psql -f database-setup/create-orders-parent-schema.sql
2/ nohup psql -c "create unique index concurrently on orders (id, created_at);" &
3/ nohup psql -c "create unique index concurrently on orders (created_at);" &
4/ psql -c "alter table orders drop constraint orders_pkey;"
5/ psql -c "alter table orders add constraint orders_pkey primary key using index orders_id_created_at_idx;"
--6/ psql -f database-setup/create-constraint-orders-old.sql
--4/ nohup psql -c "alter table orders validate constraint orders_pold_created_at;" &
6/ psql -c "alter table orders rename to orders_pold;"
7/ psql -c "alter table orders_parent rename to orders;"
8/ psql -f database-setup/exec-pgpartman.sql 
9/ psql -f database-setup/attach-old_part.sql 
```
