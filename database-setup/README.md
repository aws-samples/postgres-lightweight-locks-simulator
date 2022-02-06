# partition procedure

Determine the day the database needs to be partitioned i.e., the day the existing orders table to turn into the old partition and new orders will be written to the respective orders partition. 

1. The command below generates the constraint command for grouping orders in the old partition. e.g.,

```sql
alter table orders add constraint orders_pold_created_at check ( created_at >= '2021-09-30' and created_at <'2022-02-04 00:00:00') NOT VALID;
```
Note that the partitioning procedure MUST finish at the `created_at` upper value. i.e., the partition `orders_old` will be attached based on the time range listed in the command. 
 
```sql
psql -f database-setup/create-constraint-orders-old.sql
```
2. Create unique index for the new primary key that is the `id` and `created_at`

```sql
nohup psql -c "create unique index concurrently on orders (id, created_at);" &
```

# backup
-------------------------------------------------------
```sql
1/ psql -f database-setup/create-orders-parent-schema.sql
2/ psql -f database-setup/create-constraint-orders-old.sql
3/ nohup psql -c "alter table orders validate constraint orders_pold_created_at;" &
4/ psql -c "alter table orders drop constraint orders_pkey;"
5/ nohup psql -c "alter table orders add constraint orders_pkey primary key(id,created_at);" &
6/ psql -c "alter table orders rename to orders_pold;"
7/ psql -c "alter table orders_parent rename to orders;"
8/ psql -f database-setup/exec-pgpartman.sql 
9/ psql -f database-setup/attach-old_part.sql 
```
