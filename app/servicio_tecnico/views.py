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

    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = []
    filter_fields = crear_filtros(["id", "citas_pendientes", 'taller'])


class CitasViewSet(viewsets.ModelViewSet):
    queryset = Citas.objects.all()
    serializer_class = CitasSerializer

    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = []
    filter_fields = crear_filtros(["id", "cliente"])

    def create(self, request, *args, **kwargs):
        serializer = CitasSerializer(data=request.data)

        serializer.is_valid(raise_exception=True)
        mecanico = request.data.get('mecanico', None)
        if(mecanico is None):
            mecanicos = Mecanico.objects.order_by('citas_pendientes')[:1]
            if(len(mecanicos) > 0):
                mecanico = mecanicos.get()
                if(mecanico.citas_pendientes < 10):
                    mecanico.citas_pendientes += 1
                    mecanico.save()
                    serializer.validated_data['mecanico'] = mecanico
                    serializer.save()
                    return Response(data=serializer.data, status=status.HTTP_201_CREATED)
            return Response(data={'error': ['No hay mecánicos disponibles']}, status=status.HTTP_202_ACCEPTED)
        else:
            mecanico = serializer.validated_data['mecanico']
            mecanico.citas_pendientes += 1
            mecanico.save()
            serializer.save()
            return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def update(self, request, *args, **kwargs):
        cita_actual = Citas.objects.get(pk=request.data['id'])
        serializer = CitasSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        if (request.data['estado'] != cita_actual.estado):
            mecanico = Mecanico.objects.get(pk=request.data['mecanico'])
            if request.data['estado']:
                mecanico.citas_pendientes += 1
            else:
                mecanico.citas_pendientes -= 1
            mecanico.save()

        serializer.update(cita_actual, serializer.validated_data)
        return Response(data=serializer.data, status=status.HTTP_200_OK)

    def destroy(self, request, pk=None):
        cita = Citas.objects.get(pk=pk)
        mecanico = cita.mecanico
        mecanico.citas_pendientes -= 1
        mecanico.save()
        cita.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class RepuestosViewSet(viewsets.ModelViewSet):
    queryset = Repuestos.objects.all()
    serializer_class = RepuestosSerializer

    filter_backends = (filters.OrderingFilter, filters.SearchFilter, filter_advanced.RestFrameworkFilterBackend,
                       filter_advanced.ComplexFilterBackend)
    search_fields = []
    filter_fields = crear_filtros(["id", "cantidad"])


class RevisionTecnicaViewSet(viewsets.ModelViewSet):
    queryset = RevisionTecnica.objects.all()
    serializer_class = RevisionTecnicaSerializer


class RevisionTecnicaDetalleViewSet(viewsets.ModelViewSet):
    queryset = RevisionTecnicaDetalle.objects.all()
    serializer_class = RevisionTecnicaDetalleSerializer


class FacturaServicioViewSet(viewsets.ModelViewSet):
    queryset = FacturaServicio.objects.all()
    serializer_class = FacturaServicioSerializer
