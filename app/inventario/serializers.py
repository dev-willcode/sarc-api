from rest_framework import serializers
from .models import *


class ServicioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Servicio
        fields = "__all__"

class MarcaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Marca
        fields = "__all__"

class AutoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Auto
        fields = "__all__"

# class EquipamientoSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Equipamiento
#         fields = ['nombre', 'precio']
