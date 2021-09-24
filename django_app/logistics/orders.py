from django.shortcuts import render
from django.shortcuts import render
from logistics.models import Customer, Merchant, Order, Delivery

import uuid
from random import randrange
from datetime import date

def insert(request):
  order_uuid=uuid.uuid1()
  order_created_at=date.today().strftime("%Y-%m-%d")
  order_updated_at=date.today().strftime("%Y-%m-%d")
  order_product=uuid.uuid1()
  order_customer_id=randrange(1000000)
  order_merchant_id=randrange(1000000)

  order_obj=Order(uuid=order_uuid,created_at=order_created_at,updated_at=order_updated_at,product=order_product,customer_id=order_customer_id,merchant_id=order_merchant_id)
  order_obj.save()
  context = {
      "order": order_obj,
  }

  return render(request, "order_detail.html", context)

def update(request, uuid):
  order_obj= Order.objects.get(uuid=uuid)
  order_obj.updated_at=date.today().strftime("%Y-%m-%d")
  order_obj.save()
  context = {
      "order": order_obj,
  }
  return render(request, "order_detail.html", context)
