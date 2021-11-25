from django.conf.urls import url
from user import views

urlpatterns = [

    url(r'^ADMIN/', views.admin),
    url(r'^BANK/', views.bank),
    url(r'^SHOP/', views.shop),
]