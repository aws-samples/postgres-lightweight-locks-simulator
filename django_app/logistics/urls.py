from django.urls import path

from . import views
from . import orders
from . import sdk
from . import health


urlpatterns = [
    path("sdk/", sdk.show, name="sdk"),
    path("health/", health.show, name="health"),
    path("<uuid:uuid>/", views.order_detail, name="order_detail"),
    path("todaysorders/", views.todaysorders_detail, name="todaysorders_detail"),
    path("allorders/", views.allorders_detail, name="allorders_detail"),
    path("neworder/", orders.insert, name="insert"),
    path("authuser", orders.authuser, name="authuser"),
    path("updateorder/<uuid:uuid>/", orders.update, name="update"),

]
