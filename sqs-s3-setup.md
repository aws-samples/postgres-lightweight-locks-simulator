# queue-load-simu-setup

1. Create SQS queue for storing Orders ID to update per db. This simulator supports two databases: db-10-14-seq and db-10-14-uuid. Using the console or aws CLI create two queues and populate `QUEUE_URL` in `app-insert-db-10-14-seq.yaml`, `app-insert-db-10-14-uuid.yaml`, `app-update-db-10-14-seq.yaml`, and `app-update-db-10-14-uuid.yaml`  

2. Create S3 bucket to store the database I/O reports. `db-10-14-seq` and `db-10-14-uuid`

3. After creating the EKS cluster and the node groups, grant the role that attached to the worker nodes to `rds:DescribeDBInstances` and `s3:PuObject` to `db-10-14-seq` and `db-10-14-uuid` databases and S3 buckets.

test
