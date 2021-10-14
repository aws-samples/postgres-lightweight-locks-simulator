
`sudo -H pip3 install django`

`pip3 install django psycopg2 django-postgres-extra django-sslserver`

`django-admin startproject django_app`

`cd django_app`

`django-admin startapp logistics`

Configure the DB in `django_app/settings.py`. In the DATABASES section

Add the logistics and psqlextra to `INSTALLED_APPS` in `django_app/settings.py`

`./manage.py pgmakemigrations`

`./manage.py migrate`

### django-postgres-extra
https://django-postgres-extra.readthedocs.io/en/master/table_partitioning.html

https://pganalyze.com/blog/postgresql-partitioning-django

### Django Models 
https://docs.djangoproject.com/en/3.2/topics/db/models/

### Django Postgres sample
https://www.enterprisedb.com/postgres-tutorials/how-use-postgresql-django

### Populating the database

```sql
truncate table logistics_delivery;
truncate table logistics_order;
truncate table logistics_customer;
truncate table logistics_merchant;
SELECT setval('logistics_delivery_id_seq',1);
SELECT setval('logistics_order_id_seq',1);
SELECT setval('logistics_customer_id_seq',1);
SELECT setval('logistics_merchant_id_seq',1);

insert into logistics_customer(uuid,first_name,last_name,address) select uuid_generate_v4(),md5(RANDOM()::TEXT),md5(RANDOM()::TEXT),md5(RANDOM()::TEXT) from generate_series(1,100);
insert into logistics_merchant(uuid,name,address,license) select uuid_generate_v4(),md5(RANDOM()::TEXT),md5(RANDOM()::TEXT),md5(RANDOM()::TEXT) from generate_series(1,100);
insert into logistics_order(uuid,created_at,updated_at,product,customer_id,merchant_id) select uuid_generate_v4(),NOW(),NOW(),uuid_generate_v4(),*,* from generate_series(1,99);
insert into logistics_delivery(uuid,created_at,updated_at,method,order_id) select uuid_generate_v4(),NOW(),NOW(),md5(RANDOM()::TEXT),* from generate_series(1,99);
```
### Configure secure ALB access

#### eks cluster prep

Create ECR

```bash
./create-ecr-repos.sh
```
Build the logisitics application docker image

```bash
./build
```

Execute step 1, 2, and 3 in https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html

Provision a certificate with ACM and reference it in `django-ingres.yaml`


Deploy to eks:

```bash
kubectl apply -f django-deploy.yaml
kubectl apply -f django-svc.yaml
kubectl apply -f django-ingres.yaml
```


