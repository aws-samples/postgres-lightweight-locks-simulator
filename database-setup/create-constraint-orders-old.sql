with orders_range as (
select date(min(created_at)) min_c, date(max(created_at)) + interval '1 days' max_c from orders)
select 'alter table orders add constraint orders_pold_created_at check ( created_at >= '''||min_c||''' and created_at <'''||max_c||''') NOT VALID ;' from orders_range;
