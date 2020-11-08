from rest_framework import viewsets, filters, views
from .models import *
from .serializers import *
from rest_framework.response import Response

from rest_framework import status


class loginViewSet(viewsets.ViewSet):

    def create(self, request, *args, **kwargs):
        correo = request.data.get("correo", None)
        contrasena = request.data.get("contrasena", None)

        try:
            user = Usuario.objects.get(correo=correo, contrasena=contrasena)
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
            return Response(serializer.data)
        except Usuario.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)


class UsuarioViewSet(viewsets.ModelViewSet):
    queryset = Usuario.objects.all()
    serializer_class = UsuarioSerializer


class ClienteViewSet(viewsets.ModelViewSet):
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializer

    def create(self, request, *args, **kwargs):
        clienteserial = ClienteSerializer(data=request.data)
        if clienteserial.is_valid():
            correo = request.data.get('correo')
            contrasena = request.data.get('dni')
            usuarioserial = UsuarioSerializer(data={'correo': correo, 'contrasena': contrasena})
            if usuarioserial.is_valid():
                usuario = usuarioserial.save()
                request.data['correo'] = usuario.id
                clienteserial.save()
                return Response(status=status.HTTP_201_CREATED)
            else:
                return Response(usuarioserial.errors,
                            status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(clienteserial.errors,
                            status=status.HTTP_400_BAD_REQUEST)

class VendedorViewSet(viewsets.ModelViewSet):
    queryset = Vendedor.objects.all()
    serializer_class = VendedorSerializer


class ServicioViewSet(viewsets.ModelViewSet):
    queryset = Servicio.objects.all()
    serializer_class = ServicioSerializer


class MarcaViewSet(viewsets.ModelViewSet):
    queryset = Marca.objects.all()
    serializer_class = MarcaSerializer  


class EquipamientoViewSet(viewsets.ModelViewSet):
    queryset = Equipamiento.objects.all()
    serializer_class = EquipamientoSerializer


class ModeloAutoViewSet(viewsets.ModelViewSet):
    queryset = ModeloAuto.objects.all()
    serializer_class = ModeloAutoSerializer


class AutoViewSet(viewsets.ModelViewSet):
    queryset = Auto.objects.all()
    serializer_class = AutoSerializer


class FacturaVentaViewSet(viewsets.ModelViewSet):
    queryset = FacturaVenta.objects.all()
    serializer_class = FacturaVentaSerializer