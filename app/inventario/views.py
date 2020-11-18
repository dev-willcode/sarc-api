from django.views import View
from rest_framework import viewsets, filters, views
from .models import *
from .serializers import *

from ..servicio_tecnico.models import Mecanico
from ..servicio_tecnico.serializers import MecanicoSerializer

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
            else:
                if user.tipo == 'Vendedor':
                    entidad = Vendedor.objects.get(usuario=user.id)
                    serializer = VendedorSerializer(entidad)
                else:
                    if user.tipo == 'Mecanico':
                        entidad = Mecanico.objects.get(usuario=user.id)
                        serializer = MecanicoSerializer(entidad)
                    else:
                        if user.tipo == 'Admin':
                            return Response({'nombre': 'admin', 'correo': correo, 'tipo': 'Admin'}, status=status.HTTP_200_OK)
            return Response(
                {'id': serializer.data['id'],
                 'dni': serializer.data['dni'],
                 'nombre': serializer.data['nombre'],
                 'correo': serializer.data['correo'],
                 'domicilio': serializer.data['domicilio'],
                 'tipo': usuario.data['tipo'],
                 'usuario': usuario.data['id']},
                status=status.HTTP_200_OK)
        except Usuario.DoesNotExist:
            return Response(status=status.HTTP_204_NO_CONTENT)


class registerViewSet(viewsets.ViewSet):

    def create(self, request, *args, **kwargs):
        nombre = request.data.get("nombre")
        dni = request.data.get("dni")
        domicilio = request.data.get("domicilio")
        correo = request.data.get("correo")
        dato_usuario = request.data.get("usuario")

        cliente = Cliente(nombre=nombre, dni=dni,
                          domicilio=domicilio, correo=correo)
        cliente.save()
        usuario = Usuario.objects.get(correo=correo)
        usuario.contrasena = dato_usuario['contrasena']
        usuario.save()

        return Response(
            {'id': cliente.id,
             'dni': cliente.dni,
             'nombre': cliente.nombre,
             'correo': cliente.correo,
             'domicilio': cliente.domicilio, 'tipo': usuario.tipo,
             'usuario': usuario.id
             }, status=status.HTTP_201_CREATED)


class actualizarContrasenaViewSet(viewsets.ViewSet):

    def create(self, request, *args, **kwargs):
        id = request.data.get("id")
        contrasena_actual = request.data.get("contrasena_actual")
        nueva_contrasena = request.data.get("nueva_contrasena")
        usuario = Usuario.objects.get(pk=id)

        if(usuario.contrasena == contrasena_actual):
            serializer = UsuarioSerializer(
                usuario, data={'contrasena': nueva_contrasena}, partial=True)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response(status=status.HTTP_200_OK)
        else:
            return Response({'error': ['La constraseña actual es incorrecta']}, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)


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


class FacturaVentaReport(viewsets.ViewSet):
    queryset = FacturaVenta.objects.all()
    serializer_class = FacturaVentaSerializer

    def list(self, request, *args, **kwargs):
        data = {
            "company": "SARC S.A",
            "address": "123 Street name",
            "city": "Machala",
            "state": "El Oro",
            "zipcode": "0700001",


            "phone": "0986137722",
            "email": "willyco67@gm.co",
            "website": "sarc.com",
        }
        pdf = generate_pdf('app/pdf_template.html', data)
        return HttpResponse(pdf, content_type='application/pdf')


# -*- coding: utf-8 -*-
from django.http import HttpResponse
from django.template.loader import render_to_string
from weasyprint import HTML
import tempfile


def generate_pdf(request, source, data):
    """Generate pdf."""
    # Model data
    # people = Person.objects.all().order_by('last_name')

    # Rendered
    html_string = render_to_string(source, data)
    html = HTML(string=html_string)
    result = html.write_pdf()

    # Creating http response
    response = HttpResponse(content_type='application/pdf;')
    response['Content-Disposition'] = 'inline; filename=list_people.pdf'
    response['Content-Transfer-Encoding'] = 'binary'
    with tempfile.NamedTemporaryFile(delete=True) as output:
        output.write(result)
        output.flush()
        output = open(output.name, 'r')
        response.write(output.read())

    return response