from rest_framework import viewsets
from .models import *
from .serializers import *

class VehiculoViewSet(viewsets.ModelViewSet):
    queryset = Vehiculo.objects.all()
    serializer_class = VehiculoSerializer

class MecanicoViewSet(viewsets.ModelViewSet):
    queryset = Mecanico.objects.all()
    serializer_class = MecanicoSerializer

class RevisionTecnicaViewSet(viewsets.ModelViewSet):
    queryset = RevisionTecnica.objects.all()
    serializer_class = RevisionTecnicaSerializer

class RevisionTecnicaDetalleViewSet(viewsets.ModelViewSet):
    queryset = RevisionTecnicaDetalle.objects.all()
    serializer_class = RevisionTecnicaDetalleSerializer

class FacturaServicioViewSet(viewsets.ModelViewSet):
    queryset = FacturaServicio.objects.all()
    serializer_class = FacturaServicioSerializer
