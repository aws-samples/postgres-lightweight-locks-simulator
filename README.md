# pg buffer-content lwlock simulator
This project helps PostgreSQL users to avoid buffer_content lightweight locks (PostgreSQL LWLocks).
Customers who experienced fast growth of their PostgreSQL reported on buffer_content lightweight locks (PostgreSQL LWLocks) that reduced the primary DB throughput (inserts and updates). We found that adopting architectural database best practices help decrease and even avoid buffer_content lock contentions. Next, we provide a benchmark that includes an actual world workload with characteristics that lead to the buffer_lock contentions. We then propose the patterns to minimize the chance for buffer_content lock contentions, such as avoiding unused indexes, maintaining hot data within the writer's memory limits by table partitioning, and control the number of connections. 

We first describe the database setup and then deploy a data-generator app the populates a pseudo Ordering system. Once the database reaches a few terabytes of data, we deploy an app that simulates thousands of user orders. Finally, we share tips and best practices to minimize buffer_content locks in your PostgreSQL.

1. [database-setup](/database-setup.md)
2. [sqs-s3-setup](/sqs-s3-setup.md)
3. [k8s-loader-cluster-setup](/k8s-load-simu-setup.md)

How to minimize buffer_content locks?
We propose three ideas for minimizing buffer_content locks. The first (1) is to spread the data blocks by randomizing primary keys and other unique columns, e.g., btree UNIQUE CONSTRAINT. The second (2) is to fit the relation size to the primary (read/write) instance memory limits by reducing the number and relation sizes. Finally, the third (3) controls the number of connections to the databases as more connection processes increase the concurrency on a data block.

Below we propose the tips to minimize the buffer content LWLocks and the example workload results.

* The primary goal of fitting the relation size to the primary (read/write) instance memory limits is to allow the hot working set to live in memory to avoid disk I/O. PostgreSQL considers foreign keys, indexes, and tables as relations. 

* Partitioning  

* Connection management
