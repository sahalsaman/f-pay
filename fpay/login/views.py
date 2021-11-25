from django.shortcuts import render
from login.models import Login
from .seriallazer import android
from rest_framework.views import APIView,Response
from django.http import HttpResponse,JsonResponse

def login(request):
    if request.method == "POST":
        uname = request.POST.get("uname")
        passw = request.POST.get("pass")
        obj = Login.objects.filter(user_name=uname, password=passw)

        for ob in obj:
            tp = ob.type
            uid = ob.user_id
            if tp == "admin":
                request.session["user_id"] = uid
                return render(request, 'temp/ADMIN.html')
            elif tp == "bank":
                request.session["user_id"] = uid
                return render(request, 'temp/BANK.html')
            elif tp == "shop":
                request.session["user_id"] = uid
                return render(request, 'temp/SHOP.html')
            elif tp == "user":
                request.session["user_id"] = uid
                return render(request, 'temp/user.html')


            # else:
        objlist = "Username or Password incorrect... Please try again...!"
        context = {
            'msg': objlist,
        }
        return render(request, 'login/login.html', context)

    return render(request,'login/login.html')

class Android(APIView):
    def post(self,request):
        u=request.data['u']
        p=request.data['p']
        obj=Login.objects.filter(uname=u,passw=p)
        if len(obj)>0:
            return HttpResponse('Success')
        else:
            return HttpResponse('Failed')
        # ser=android(obj,many=True)
        # return Response(ser.data)