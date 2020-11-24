from rest_framework import serializers
from .models import *
from drf_writable_nested.serializers import WritableNestedModelSerializer

class VehiculoSerializer(serializers.ModelSerializer):
    nombre_cliente = serializers.CharField(
        source="cliente.nombre", read_only=True)

    class Meta:
        model = Vehiculo
        fields = "__all__"


class MecanicoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mecanico
        fields = "__all__"


class CitasSerializer(serializers.ModelSerializer):
    nombre_cliente = serializers.CharField(
        source="cliente.nombre", read_only=True)
    nombre_mecanico = serializers.CharField(
        source="mecanico.nombre", read_only=True)

    class Meta:
        model = Citas
        fields = "__all__"


class RepuestosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Repuestos
        fields = "__all__"


class RevisionTecnicaDetalleSerializer(serializers.ModelSerializer):
    class Meta:
        model = RevisionTecnicaDetalle
        fields = "__all__"


class RevisionTecnicaSerializer(WritableNestedModelSerializer):
    nombre_mecanico = serializers.CharField(
        source="mecanico.nombre", read_only=True)
    nombre_cliente = serializers.CharField(
        source="cliente.nombre", read_only=True)
    matricula = serializers.CharField(
        source="vehiculo.matricula", read_only=True)
    revision_detalle = RevisionTecnicaDetalleSerializer(many=True)
    class Meta:
        model = RevisionTecnica
        fields = "__all__"


class FacturaServicioDetalleSerializer(serializers.ModelSerializer):
    class Meta:
        model = FacturaServicioDetalle
        fields = "__all__"

    def create(self, validated_data):
        respuesto = validated_data.get('repuesto', None)
        cantidad = validated_data.get('cantidad')
        
        if respuesto is not None:
            repuesto = Repuestos.objects.get(pk=respuesto.id)
            repuesto.cantidad -= cantidad
            repuesto.save()
        return FacturaServicioDetalle.objects.create(**validated_data)


class FacturaServicioSerializer(WritableNestedModelSerializer):
    nombre_cliente = serializers.CharField(
        source="cliente.nombre", read_only=True)
    detalle_servicio = FacturaServicioDetalleSerializer(many=True)

    class Meta:
        model = FacturaServicio
        fields = "__all__"
