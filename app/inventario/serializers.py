import app.inventario.models
from rest_framework import serializers
from .models import *
from drf_writable_nested.serializers import WritableNestedModelSerializer


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
        

class ModeloAutoImagenSerializer(serializers.ModelSerializer):
    class Meta:
        model = ModeloAutoImagen
        fields = "__all__"


class ModeloAutoSerializer(WritableNestedModelSerializer):
    equipamientos_auto = serializers.SerializerMethodField(
        'get_equipamientos_auto', read_only=True)
    modelo_imagenes = ModeloAutoImagenSerializer(many=True, read_only=True)
    
    class Meta:
        model = ModeloAuto
        fields = "__all__"
    
    def get_equipamientos_auto(self, obj):
        serializer = EquipamientoSerializer(obj.equipamientos, many=True)
        return serializer.data


class AutoSerializer(serializers.ModelSerializer):
    nombre_modelo = serializers.CharField(
        source='modelo_auto.nombre_modelo', read_only=True)
    precio_modelo = serializers.CharField(
        source='modelo_auto.precio', read_only=True)
    descuento_modelo = serializers.CharField(
        source='modelo_auto.descuento', read_only=True)
    servicio = serializers.CharField(
        source='concesionario.nombre', read_only=True)
    equipamientos_auto = serializers.SerializerMethodField(
        'get_equipamientos_auto', read_only=True)

    class Meta:
        model = Auto
        fields = "__all__"

    def get_equipamientos_auto(self, obj):
        modelo = ModeloAuto.objects.get(pk=obj.modelo_auto.pk)
        serializer = ModeloAutoSerializer(modelo)
        return serializer.data['equipamientos_auto']


class FacturaVentaDetalleSerializer(serializers.ModelSerializer):

    class Meta:
        model = FacturaVentaDetalle
        fields = "__all__"


class FacturaVentaSerializer(WritableNestedModelSerializer):
    nombre_cliente = serializers.CharField(
        source="cliente.nombre", read_only=True)
    nombre_vendedor = serializers.CharField(
        source="vendedor.nombre", read_only=True)
    nombre_modelo = serializers.CharField(
        source="auto.modelo_auto.nombre_modelo", read_only=True)
    auto_bastidor = serializers.CharField(
        source="auto.bastidor", read_only=True)
    detalle_factura = FacturaVentaDetalleSerializer(many=True)

    class Meta:
        model = FacturaVenta
        fields = '__all__'
