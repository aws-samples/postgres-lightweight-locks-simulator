from django.shortcuts import render
from django.shortcuts import render


def show(request):
  
  context = {
      "customer_id": cust_id_tuple,
  }
  return render(request, "authuser.html", context)
