CREATE SCHEMA partman;
CREATE EXTENSION pg_partman WITH SCHEMA partman;

SELECT partman.create_parent( p_parent_table => 'public.orders',
 p_control => 'created_at',
 p_type => 'native',
 p_start_partition => '2022-12-02',
 p_interval=> 'monthly',
 p_premake => 12);

CREATE EXTENSION pg_cron;

UPDATE partman.part_config 
SET infinite_time_partitions = true,
    retention = '3 months', 
    retention_keep_table=true 
WHERE parent_table = 'public.orders';
SELECT cron.schedule('@hourly', $$CALL partman.run_maintenance_proc()$$);
