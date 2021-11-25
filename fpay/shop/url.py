from django.conf.urls import url
from shop import views

urlpatterns = [
    # url(r'^s_login/',views.shop_login),
    url(r'^s_reg/',views.shop_registration),
    url(r'^payment/',views.payment),
    url(r'^d_req_st/',views.device_request_status_view),
    url(r'^d_list/',views.device_list),
    url(r'^devicerequest/(?P<idd>\w+)', views.devicerequest, name='devicerequest'),
]