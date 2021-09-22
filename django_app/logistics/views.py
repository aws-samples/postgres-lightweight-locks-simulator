from django.shortcuts import render
from django.shortcuts import render
from logistics.models import Customer, Merchant, Order, Delivery

def order_detail(request, pk):
  order_obj= Order.objects.get(pk=pk)
  order_obj.tags='order-app'
  delivery_objs=Delivery.objects.filter(order_id=order_obj.id)
  #delivery_obj=Delivery.objects.raw('SELECT * FROM logistics_delivery WHERE order_id='+str(order_obj.id)+' LIMIT 1')
  context = {
      "order": order_obj,
      "deliveries": delivery_objs,

  }

  return render(request, "order_detail.html", context)
