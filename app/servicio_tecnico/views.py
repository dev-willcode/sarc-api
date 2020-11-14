from rest_framework import viewsets, filters
from .models import *
from .serializers import *
from ..inventario.serializers import UsuarioSerializer
from rest_framework.response import Response
from rest_framework import status

from rest_framework import status
import rest_framework_filters.backends as filter_advanced
from ..shared.generate_filters import crear_filtros

class VehiculoViewSet(viewsets.ModelViewSet):
    queryset = Vehiculo.objects.all()
    serializer_class = VehiculoSerializer

    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = []
    filter_fields = crear_filtros(["cliente"])


class MecanicoViewSet(viewsets.ModelViewSet):
    queryset = Mecanico.objects.all()
    serializer_class = MecanicoSerializer


class CitasViewSet(viewsets.ModelViewSet):
    queryset = Citas.objects.all()
    serializer_class = CitasSerializer


class RepuestosViewSet(viewsets.ModelViewSet):
    queryset = Repuestos.objects.all()
    serializer_class = RepuestosSerializer


class RevisionTecnicaViewSet(viewsets.ModelViewSet):
    queryset = RevisionTecnica.objects.all()
    serializer_class = RevisionTecnicaSerializer


class RevisionTecnicaDetalleViewSet(viewsets.ModelViewSet):
    queryset = RevisionTecnicaDetalle.objects.all()
    serializer_class = RevisionTecnicaDetalleSerializer


class FacturaServicioViewSet(viewsets.ModelViewSet):
    queryset = FacturaServicio.objects.all()
    serializer_class = FacturaServicioSerializer
