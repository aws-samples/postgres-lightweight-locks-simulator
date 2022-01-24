CREATE SCHEMA partman;
CREATE EXTENSION pg_partman WITH SCHEMA partman;

SELECT partman.create_parent( p_parent_table => 'public.orders',
 p_control => 'created_at',
 p_type => 'native',
 p_start_partition => '2022-01-21',
 p_interval=> 'daily',
 p_premake => 10);
