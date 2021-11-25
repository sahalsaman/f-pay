from django.conf.urls import url
from device import views

urlpatterns = [
    url(r'^d_reg/',views.device_registration),
    url(r'^d_req_vw/', views.device_request_view),
    url(r'^approve/(?P<idd>\w+)',views.approve,name='approve1'),
    url(r'^reject/(?P<idd>\w+)', views.reject, name='reject1'),
    url(r'^d_mng/',views.manage_device),
    url(r'^accept/(?P<icc>\w+)',views.accept,name='accept2'),
    url(r'^block/(?P<icc>\w+)', views.block, name='block2'),



]