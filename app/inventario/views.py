from rest_framework import viewsets, filters, views
from .models import *
from .serializers import *
from rest_framework.response import Response
from rest_framework import status
import rest_framework_filters.backends as filter_advanced
from ..shared.generate_filters import crear_filtros


class loginViewSet(viewsets.ViewSet):

    def create(self, request, *args, **kwargs):
        correo = request.data.get("correo", None)
        contrasena = request.data.get("contrasena", None)

        try:
            user = Usuario.objects.get(correo=correo, contrasena=contrasena)
            usuario = UsuarioSerializer(user)
            serializer = None
            entidad = None
            if user.tipo == 'Cliente':
                entidad = Cliente.objects.get(usuario=user.id)
                serializer = ClienteSerializer(entidad)
            if user.tipo == 'Vendedor':
                entidad = Cliente.objects.get(usuario=user.id)
                serializer = ClienteSerializer(entidad)
            if user.tipo == 'Mecanico':
                entidad = Cliente.objects.get(usuario=user.id)
                serializer = ClienteSerializer(entidad)
            return Response({'persona': serializer.data, 'usuario': usuario.data})
        except Usuario.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)


class UsuarioViewSet(viewsets.ModelViewSet):
    queryset = Usuario.objects.all()
    serializer_class = UsuarioSerializer


class ClienteViewSet(viewsets.ModelViewSet):
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializer


class VendedorViewSet(viewsets.ModelViewSet):
    queryset = Vendedor.objects.all()
    serializer_class = VendedorSerializer


class ServicioViewSet(viewsets.ModelViewSet):
    queryset = Servicio.objects.all()
    serializer_class = ServicioSerializer

    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = []
    filter_fields = crear_filtros(["tipo"])


class MarcaViewSet(viewsets.ModelViewSet):
    queryset = Marca.objects.all()
    serializer_class = MarcaSerializer


class EquipamientoViewSet(viewsets.ModelViewSet):
    queryset = Equipamiento.objects.all()
    serializer_class = EquipamientoSerializer

    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = []
    filter_fields = crear_filtros(["id", "nombre", "precio"])


class ModeloAutoViewSet(viewsets.ModelViewSet):
    queryset = ModeloAuto.objects.all()
    serializer_class = ModeloAutoSerializer

    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = []
    filter_fields = crear_filtros(['id', "nombre_modelo"])


class AutoViewSet(viewsets.ModelViewSet):
    queryset = Auto.objects.all()
    serializer_class = AutoSerializer

    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = []
    filter_fields = crear_filtros(["estado"])


class FacturaVentaViewSet(viewsets.ModelViewSet):
    queryset = FacturaVenta.objects.all()
    serializer_class = FacturaVentaSerializer
