from django.shortcuts import render
from shop.models import ShopReg, BillGen
from shop.models import DeviceRequest
from device.models import DeviceReg
from login.models import Login
from shop.models import Payment
from django.http import HttpResponseRedirect



def shop_registration(request):
    if request.method == "POST":
        obj = ShopReg()
        obj.shop_name = request.POST.get('sname')
        obj.address = request.POST.get('add')
        obj.shop_owner_name = request.POST.get('oname')
        obj.mob_no = request.POST.get('mno')
        obj.upi_code = request.POST.get('upi')
        obj.status = 'pending'
        obj.save()

        ob = Login()
        ob.user_name = request.POST.get('uname')
        ob.password = request.POST.get('pass')
        ob.user_id = obj.shop_id
        ob.type = 'shop'
        ob.save()
    return render(request,'shop/shop registration.html')


def payment(request):
    uid = request.session["user_id"]
    oblist = Payment.objects.filter(shop_id=uid)
    context = {
        'objval': oblist,
    }
    return render(request,'shop/bill gen.html',context)


def device_request_status_view(request):
    uid = request.session["user_id"]
    oblist = DeviceRequest.objects.filter(shop_id=uid)
    context = {
        'objval': oblist,
    }
    return render(request,'shop/device request status view.html',context)


def device_list(request):
    oblist = DeviceReg.objects.all()
    context = {
        'objval': oblist,
    }
    return render(request,'shop/device list.html',context)


def devicerequest(request,idd):
    uid=request.session["user_id"]
    ob = ShopReg.objects.get(shop_id=uid)
    nm=ob.shop_name
    obj = DeviceRequest()
    obj.d_id = idd
    obj.shop_id = request.session["user_id"]
    obj.shop_name = nm
    obj.status = "requested"
    obj.save()
    return HttpResponseRedirect('/shop/d_req_st')

    # if request.method=="POST":
    #     obj=DeviceRequest.objects.get(d_id=idd)
    #     obj.shop_id=request.session["user_id"]
    #     obj.status ="requested"
    #     obj.save()
    # return render(request,'shop/device request status view.html')
        # return HttpResponseRedirect(device_request_status_view())  device_request_status_view(request)
    # return render(request,'shop/device request status view.html')

