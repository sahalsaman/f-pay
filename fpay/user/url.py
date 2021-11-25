from django.conf.urls import url
from user import views

urlpatterns = [
    url(r'^user_log/',views.user_login),
    url(r'^user_reg/',views.user_registration),
    url(r'^user_bank/', views.user_bank_details),
    url(r'^user_home/', views.home),
    url(r'^user_starting_page/', views.starting_page),
    url(r'^user_verify/',views.user_verify_view),
    url(r'^approve/(?P<idd>\w+)', views.approve, name='approve'),
    url(r'^reject/(?P<idd>\w+)', views.reject, name='reject'),
    url('^android/',views.Android.as_view())

]