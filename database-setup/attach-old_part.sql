with orders_range as (
select date(min(created_at)) min_c, date(max(created_at)) + interval '1 days' max_c from orders_pold)
select 'alter table orders attach partition orders_pold for values from ('''||min_c||''') to ('''||max_c||''');' from orders_range;
