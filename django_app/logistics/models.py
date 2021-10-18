from django.db import models
from psqlextra.types import PostgresPartitioningMethod
from psqlextra.models import PostgresPartitionedModel

class Customer(models.Model):
  uuid = models.UUIDField(null=False)
  first_name = models.CharField(max_length=50,null=False)
  last_name = models.CharField(max_length=50,null=False)
  address = models.CharField(max_length=150,null=False)

class Merchant(models.Model):
  uuid = models.UUIDField(null=False)
  name = models.CharField(max_length=50,null=False)
  address = models.CharField(max_length=150,null=False)
  license = models.CharField(max_length=50,null=False)

class Order(PostgresPartitionedModel):
  class PartitioningMeta:
    method = PostgresPartitioningMethod.RANGE
    key = ["created_at"]

  uuid = models.UUIDField(null=False)
  created_at = models.DateTimeField(null=False)
  updated_at = models.DateTimeField(null=False)
  product = models.UUIDField(null=False)
  merchant  = models.ForeignKey("Merchant", on_delete=models.CASCADE,null=True)
  #customer = models.ForeignKey("Customer", on_delete=models.CASCADE,null=True)
  customer_id = models.BigIntegerField(null=False)


class Delivery(PostgresPartitionedModel):
  class PartitioningMeta:
    method = PostgresPartitioningMethod.RANGE
    key = ["created_at"]

  uuid = models.UUIDField(null=False)
  created_at = models.DateTimeField(null=False)
  method = models.CharField(max_length=50,null=False)
  status = models.CharField(max_length=50,null=True)
  updated_at = models.DateTimeField(null=False)
  order_id = models.BigIntegerField(null=True)
