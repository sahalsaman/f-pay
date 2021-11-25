from rest_framework import serializers
from .models import Login

class android(serializers.ModelSerializer):
    class Meta:
        models=Login
        fields='__all__'