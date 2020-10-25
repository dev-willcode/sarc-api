from django.db import models
from ..inventario.models import *

class Vehiculo(models.Model):
    cliente = models.ForeignKey(
        Cliente, on_delete=models.PROTECT, null=False, blank=False)
    chasis = models.CharField(max_length=50, blank=False, null=False)
    matricula = models.CharField(max_length=50, blank=False, null=False)

    def __str__(self):
        return self.matricula


class Mecanico(models.Model):
    persona = models.ForeignKey(
        Persona, on_delete=models.PROTECT, null=False, blank=False)
    taller = models.ForeignKey(
        Servicio, on_delete=models.PROTECT, null=False, blank=False)


class RevisionTecnica(models.Model):
    vehiculo = models.ForeignKey(
        Vehiculo, on_delete=models.PROTECT, null=False, blank=False)
    mecanico = models.ForeignKey(
        Mecanico, on_delete=models.PROTECT, null=False, blank=False)
    kilometraje_actual = models.DecimalField(max_digits=10, decimal_places=2)
    fecha_revision = models.DateField(blank=False, null=False)
    fecha_proxima_revision = models.DateField(blank=False, null=False)


class RevisionTecnicaDetalle(models.Model):
    revision_tecnica = models.ForeignKey(
        RevisionTecnica, on_delete=models.PROTECT, null=False, blank=False)
    repuesto = models.ForeignKey(
        Equipamiento, on_delete=models.PROTECT, null=False, blank=False)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    descripcion = models.CharField(max_length=50, blank=False, null=False)


class FacturaServicio(models.Model):
    revision_tecnica = models.ForeignKey(
        'RevisionTecnica', on_delete=models.PROTECT, null=False, blank=False)
    numero_factura = models.CharField(max_length=17, blank=False, null=False)
    fecha_emision = models.DateField(blank=False, null=False)
    total = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.numero_factura
