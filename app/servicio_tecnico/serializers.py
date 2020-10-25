from rest_framework import serializers
from .models import *


class VehiculoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vehiculo
        fields = "__all__"

class MecanicoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mecanico
        fields = "__all__"

class RevisionTecnicaSerializer(serializers.ModelSerializer):
    class Meta:
        model = RevisionTecnica
        fields = "__all__"

class RevisionTecnicaDetalleSerializer(serializers.ModelSerializer):
    class Meta:
        model = RevisionTecnicaDetalle
        fields = "__all__"

class FacturaServicioSerializer(serializers.ModelSerializer):
    class Meta:
        model = FacturaServicio
        fields = "__all__"                
