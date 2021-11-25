from rest_framework import serializers
from .models import UserReg,Payment

class android(serializers.ModelSerializer):
    class Meta:
        model=UserReg
        fields='__all__'

class android1(serializers.ModelSerializer):
    class Meta:
        model=Payment
        fields='__all__'