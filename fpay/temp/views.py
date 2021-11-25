from django.shortcuts import render

# Create your views here.

def admin(request):
    return render(request,'temp/ADMIN.html')


def bank(request):
    return render(request, 'temp/BANK.html')


def shop(request):
    return render(request, 'temp/SHOP.html')