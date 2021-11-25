from django.conf.urls import url
from bank import views

urlpatterns = [
    url(r'^c_reg/',views.customer_bank),
    url(r'^b_reg/',views.bank_reg),
    # url(r'^d_mng/', views.manage_device),
    # url(r'^accept/(?P<icc>\w+)', views.accept, name='accept2'),
    # url(r'^block/(?P<icc>\w+)', views.block, name='block2'),
]