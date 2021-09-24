from django.shortcuts import render
from django.shortcuts import render
from logistics.models import Customer, Merchant, Order, Delivery
from datetime import date

def order_detail(request, uuid):
  order_obj= Order.objects.get(uuid=uuid)
  delivery_objs=Delivery.objects.filter(order_id=order_obj.id)
  #delivery_obj=Delivery.objects.raw('SELECT * FROM logistics_delivery WHERE order_id='+str(order_obj.id)+' LIMIT 1')
  context = {
      "order": order_obj,
      "deliveries": delivery_objs,
  }
  return render(request, "order_detail.html", context)

def todaysorders_detail(request):
  order_objs= Order.objects.filter(created_at=date.today().strftime("%Y-%m-%d"))
  context = {
      "orders": order_objs,
  }
  return render(request, "orders_detail.html", context)

def allorders_detail(request):
  order_objs= Order.objects.all()
  context = {
      "orders": order_objs,
  }
  return render(request, "orders_detail.html", context)
