from django.shortcuts import render
from bank.models import BankReg
from bank.models import CustomerBank
from login.models import Login
# Create your views here.


def bank_reg(request):
    if request.method == "POST":
        obj = BankReg()
        obj.bank_name = request.POST.get('bank')
        obj.ifsc_code = request.POST.get('ifsc')
        obj.address = request.POST.get('add')
        obj.e_mail = request.POST.get('email')
        obj.phone_no = request.POST.get('mno')
        obj.save()
        ob=Login()
        ob.user_name=request.POST.get('uname')
        ob.password = request.POST.get('pass')
        ob.user_id =obj.id
        ob.type = 'bank'
        ob.save()
    return render(request,'bank/bank reg.html')


def customer_bank(request):
    c=request.POST.get('balance')
    a=request.POST.get('acc')
    uid=request.session['user_id']
    obb=Login.objects.get(log_id=uid)
    if request.method == "POST":
        if CustomerBank.objects.filter(acc_no=a).exists():

            obj = CustomerBank.objects.get(acc_no=a)
            # obj.full_name = request.POST.get('name')
            # obj.mob_no = request.POST.get('mno')
            # obj.address = request.POST.get('add')
            # obj.acc_no = request.POST.get('acc')
            # obj.upi_code = request.POST.get('upi code')
            obj.balance = int(c)+obj.balance

            # obj.bank_id=obb.user_id
            # obj.user_id=1
            # obj.status = 'pending'
            obj.save()
    return render(request,'bank/custum reg.html')