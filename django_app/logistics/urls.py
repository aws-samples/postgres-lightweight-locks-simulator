from django.urls import path

from . import views



urlpatterns = [

    path("<int:pk>/", views.order_detail, name="order_detail"),

]
