from rest_framework import viewsets, filters
from .models import *
from .serializers import *
from ..inventario.serializers import UsuarioSerializer
from rest_framework.response import Response
from rest_framework import status

class VehiculoViewSet(viewsets.ModelViewSet):
    queryset = Vehiculo.objects.all()
    serializer_class = VehiculoSerializer


class MecanicoViewSet(viewsets.ModelViewSet):
    queryset = Mecanico.objects.all()
    serializer_class = MecanicoSerializer
    
    def create(self, request, *args, **kwargs):
        correo = request.data['correo']
        contrasena = request.data['dni']
        mecanicoserial = MecanicoSerializer(data=request.data)
        usuarioserial = UsuarioSerializer(data={'correo': correo, 'contrasena': contrasena})

        mecanicoserial.is_valid(raise_exception=True)
        usuarioserial.is_valid(raise_exception=True)
        usuario = usuarioserial.save()
        mecanico = mecanicoserial.save()
        mecanicoserial.update(mecanico, validated_data={'usuario': usuario})
        return Response(mecanicoserial.data, status=status.HTTP_201_CREATED)

    def update(self, request, *args, **kwargs):
        mecanico = self.get_object()
        correo = request.data['correo']
        usuario = Usuario.objects.get(pk=request.data['usuario'])
        usuarioserial = UsuarioSerializer(usuario, data={'correo': correo}, partial=True)
        mecanicoserial = MecanicoSerializer(mecanico, data=request.data, partial=True)
        mecanicoserial.is_valid(raise_exception=True)
        usuarioserial.is_valid(raise_exception=True)
        usuarioserial.save()
        mecanicoserial.save()
        return Response(mecanicoserial.data, status=status.HTTP_200_OK)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        usuario = instance.usuario
        usuario.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class RevisionTecnicaViewSet(viewsets.ModelViewSet):
    queryset = RevisionTecnica.objects.all()
    serializer_class = RevisionTecnicaSerializer


class RevisionTecnicaDetalleViewSet(viewsets.ModelViewSet):
    queryset = RevisionTecnicaDetalle.objects.all()
    serializer_class = RevisionTecnicaDetalleSerializer


class FacturaServicioViewSet(viewsets.ModelViewSet):
    queryset = FacturaServicio.objects.all()
    serializer_class = FacturaServicioSerializer

