from rest_framework import serializers
from .models import *


class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = "__all__"


class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente
        fields = "__all__"


class VendedorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vendedor
        fields = "__all__"


class ServicioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Servicio
        fields = "__all__"


class MarcaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Marca
        fields = "__all__"


class EquipamientoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Equipamiento
        fields = "__all__"


class ModeloAutoSerializer(serializers.ModelSerializer):
    class Meta:
        model = ModeloAuto
        fields = "__all__"


class ModeloAutoSerializerList(serializers.ModelSerializer):
    equipamientos = EquipamientoSerializer(many=True, read_only=True)

    class Meta:
        model = ModeloAuto
        fields = "__all__"


class AutoSerializer(serializers.ModelSerializer):
    modelo = serializers.SerializerMethodField('get_modelo', read_only=True)
    servicio = serializers.SerializerMethodField('get_servicio', read_only=True)
    equipamientos_auto = serializers.SerializerMethodField('get_equipamientos_auto', read_only=True)
    class Meta:
        model = Auto
        fields = "__all__"

    def get_modelo(self, obj):
        modelo = ModeloAuto.objects.get(pk=obj.modelo_auto.pk)
        return modelo.nombre_modelo
    
    def get_servicio(self, obj):
        servicio = Servicio.objects.get(pk=obj.concesionario.pk)
        return servicio.nombre
    
    def get_equipamientos_auto(self, obj):
        modelo = ModeloAuto.objects.get(pk=obj.modelo_auto.pk)
        serializer = ModeloAutoSerializerList(modelo)
        return serializer.data['equipamientos']


class FacturaVentaSerializer(serializers.ModelSerializer):
    nombre_cliente = serializers.SerializerMethodField('get_nombre_cliente', read_only=True)
    modelo = serializers.SerializerMethodField('get_modelo', read_only=True)
    
    class Meta:
        model = FacturaVenta
        fields = "__all__"
    
    def get_nombre_cliente(self, obj):
        cliente = Cliente.objects.get(pk=obj.cliente.pk)
        return cliente.nombre
    
    def get_modelo(self, obj):
        modelo = ModeloAuto.objects.get(pk=obj.auto.modelo_auto.pk)
        return modelo.nombre_modelo