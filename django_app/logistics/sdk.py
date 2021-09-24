from django.shortcuts import render
from django.shortcuts import render

sdk_title='Logistics Django'
api_calls=['/logistics/new_order - create a new order - return order details',
	'/logistics/<order uuid> - get order details - retrun order details',
        '/logistics/update_order/<order uuid> - update order - return order details',
        '/logistics/todaysorders - return todays orders',
        '/logistics/allorders - return todays orders',]
        

def show(request):
  
  context = {
      "name": sdk_title,
      "apis": api_calls,
  }
  return render(request, "sdk.html", context)
