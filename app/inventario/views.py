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

    def create(self, request, *args, **kwargs):
        correo = request.data['correo']
        contrasena = request.data['dni']
        clienteserial = ClienteSerializer(data=request.data)
        usuarioserial = UsuarioSerializer(data={'correo': correo, 'contrasena': contrasena})

        clienteserial.is_valid(raise_exception=True)
        usuarioserial.is_valid(raise_exception=True)
        usuario = usuarioserial.save()
        cliente = clienteserial.save()
        clienteserial.update(cliente, validated_data={'usuario': usuario})
        return Response(clienteserial.data, status=status.HTTP_201_CREATED)

    def update(self, request, *args, **kwargs):
        cliente = self.get_object()
        correo = request.data['correo']
        usuario = Usuario.objects.get(pk=request.data['usuario'])
        usuarioserial = UsuarioSerializer(usuario, data={'correo': correo}, partial=True)
        clienteserial = ClienteSerializer(cliente, data=request.data, partial=True)
        clienteserial.is_valid(raise_exception=True)
        usuarioserial.is_valid(raise_exception=True)
        usuarioserial.save()
        clienteserial.save()
        return Response(clienteserial.data, status=status.HTTP_200_OK)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        usuario = instance.usuario
        usuario.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class VendedorViewSet(viewsets.ModelViewSet):
    queryset = Vendedor.objects.all()
    serializer_class = VendedorSerializer

    def create(self, request, *args, **kwargs):
        correo = request.data['correo']
        contrasena = request.data['dni']
        vendedorserial = VendedorSerializer(data=request.data)
        usuarioserial = UsuarioSerializer(data={'correo': correo, 'contrasena': contrasena})

        vendedorserial.is_valid(raise_exception=True)
        usuarioserial.is_valid(raise_exception=True)
        usuario = usuarioserial.save()
        vendedor = vendedorserial.save()
        vendedorserial.update(vendedor, validated_data={'usuario': usuario})
        return Response(vendedorserial.data, status=status.HTTP_201_CREATED)

    def update(self, request, *args, **kwargs):
        vendedor = self.get_object()
        correo = request.data['correo']
        usuario = Usuario.objects.get(pk=request.data['usuario'])
        usuarioserial = UsuarioSerializer(usuario, data={'correo': correo}, partial=True)
        vendedorserial = VendedorSerializer(vendedor, data=request.data, partial=True)
        vendedorserial.is_valid(raise_exception=True)
        usuarioserial.is_valid(raise_exception=True)
        usuarioserial.save()
        vendedorserial.save()
        return Response(vendedorserial.data, status=status.HTTP_200_OK)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        usuario = instance.usuario
        usuario.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


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
