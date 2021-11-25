from django.shortcuts import render
from device.models import DeviceReg
from shop.models import DeviceRequest
from device.models import ShopReg
# Create your views here.


def device_registration(request):
    if request.method == "POST":
        obj = DeviceReg()
        obj.device_name = request.POST.get('dname')
        obj.serial_no = request.POST.get('sno')
        obj.model_no = request.POST.get('mno')
        obj.status = 'pending'
        obj.save()

    return render(request,'device/device registration.html')

def device_request_view(request):
    oblist = DeviceRequest.objects.all()
    context = {
        'objval': oblist,
    }
    return render(request,'device/device request view.html',context)




def manage_device(request):
    oblist = DeviceReg.objects.all()
    context = {
        'objval': oblist,
    }
    return render(request,'device/manage device.html',context)


def approve(request,idd):
    oblist = DeviceReg.objects.get(did=idd)
    context = {
        'objval': oblist,
    }

    if request.method=="POST":

        oblist.device_name = request.POST.get('dname')
        oblist.serial_no = request.POST.get('sno')
        oblist.model_no = request.POST.get('mno')
        oblist.status = 'pending'
        oblist.save()
    return render(request,'device/device update.html',context)


def reject(request,idd):
    obj=DeviceReg.objects.get(did=idd)
    obj.delete()
    return manage_device(request)

def accept(request,icc):
    obj = DeviceRequest.objects.get(id=icc)
    obj.status = "approved"
    obj.save()
    return device_request_view(request)

def block(request,icc):
    obj = DeviceRequest.objects.get(id=icc)
    obj.status = "reject"
    obj.save()
    return device_request_view(request)


