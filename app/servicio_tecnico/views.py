from rest_framework import viewsets, filters
from .models import *
from .serializers import *
import rest_framework_filters.backends as filter_advanced
from ..shared.generate_filters import crear_filtros, listado_filtrado

class VehiculoViewSet(viewsets.ModelViewSet):
    queryset = Vehiculo.objects.all()
    serializer_class = VehiculoSerializer
    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = ["chasis", "matricula"]
    filter_fields = crear_filtros(["chasis", "matricula"])

    def list(self, request, *args, **kwargs):
        return listado_filtrado(self)

class MecanicoViewSet(viewsets.ModelViewSet):
    queryset = Mecanico.objects.all()
    serializer_class = MecanicoSerializer
    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = []
    filter_fields = crear_filtros([])

    def list(self, request, *args, **kwargs):
        return listado_filtrado(self)

class RevisionTecnicaViewSet(viewsets.ModelViewSet):
    queryset = RevisionTecnica.objects.all()
    serializer_class = RevisionTecnicaSerializer
    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = []
    filter_fields = crear_filtros([])

    def list(self, request, *args, **kwargs):
        return listado_filtrado(self)

class RevisionTecnicaDetalleViewSet(viewsets.ModelViewSet):
    queryset = RevisionTecnicaDetalle.objects.all()
    serializer_class = RevisionTecnicaDetalleSerializer
    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = []
    filter_fields = crear_filtros([])

    def list(self, request, *args, **kwargs):
        return listado_filtrado(self)

class FacturaServicioViewSet(viewsets.ModelViewSet):
    queryset = FacturaServicio.objects.all()
    serializer_class = FacturaServicioSerializer
    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = ["numero_factura"]
    filter_fields = crear_filtros(["numero_factura"])

    def list(self, request, *args, **kwargs):
        return listado_filtrado(self)
