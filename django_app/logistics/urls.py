from django.urls import path

from . import views
from . import orders
from . import sdk


urlpatterns = [
    path('sdk/', sdk.show, name="sdk"),
    path("<uuid:uuid>/", views.order_detail, name="order_detail"),
    path("todaysorders/", views.todaysorders_detail, name="todaysorders_detail"),
    path("allorders/", views.allorders_detail, name="allorders_detail"),
    path('new_order/', orders.insert, name="insert"),
    path('update_order/<uuid:uuid>/', orders.update, name="update"),

]
