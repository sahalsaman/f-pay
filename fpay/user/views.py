from django.shortcuts import render
from user.models import UserReg, Payment
from user.models import UserBankDetails
from login.models import Login
from .seriallazer import android,android1
from rest_framework.views import APIView,Response
from django.http import HttpResponse,JsonResponse

# Create your views here.


def user_registration(request):
    if request.method == "POST":
        obj = UserReg()
        obj.user_name = request.POST.get('name')
        obj.address = request.POST.get('add')
        obj.mob_no = request.POST.get('mobno')
        obj.status = 'pending'
        obj.pin= request.POST.get('pin')
        obj.save()


        ob = Login()
        ob.user_name = request.POST.get('name')
        ob.password = request.POST.get('pin')
        ob.user_id = obj.user_id
        ob.type = 'user'
        ob.save()
    return render(request,'user/user registration.html')


def user_bank_details(request):
    if request.method == "POST":
          obj = UserBankDetails()
          obj.user_id = 1
          obj.bank = request.POST.get('bank')
          obj.upi_code = request.POST.get('upi code')
          obj.save()
    return render(request,'user/user bank details.html')


def user_verify_view(request):
    oblist = UserReg.objects.all()
    context = {
        'objval': oblist,
    }
    return render(request,'user/user verify view.html',context)


def approve(request,idd):
    obj=UserReg.objects.get(user_id=idd)
    obj.status="approve"
    obj.save()
    return user_verify_view(request)


def reject(request,idd):
    obj=UserReg.objects.get(user_id=idd)
    obj.status="reject"
    obj.save()
    return user_verify_view(request)


def user_login(request):
    if request.method == "POST":
        name = request.POST.get("name")
        pin = request.POST.get("pin")
        try:
            obj = UserReg.objects.get(user_name=name, pin=pin)

            if obj:
                return render(request,'user/user_home.html')

        except:
            pass

    return render(request, "user/user login.html")



def starting_page(request):
    return render(request,"user/starting page.html")

def home(request):
    return render(request,"user/user_home.html")


class Android(APIView):
    def get(self,request):

        obj=Payment.objects.all()
        ser=android1(obj,many=True)
        return Response(ser.data)
    def post(self,request):
        obj = UserReg()
        obj.user_name = request.data['name']
        obj.address = ''
        obj.mob_no = request.data['phone']
        obj.status = 'pending'
        obj.pin = request.data['password']
        obj.save()

        ob = Login()
        ob.user_name = request.data['name']
        ob.password = request.data['password']
        ob.user_id = obj.user_id
        ob.type = 'user'
        ob.save()
        return HttpResponse('ok')
