from django.db import models
from app.inventario.models import *


# Create your models here.
class Vehiculo(models.Model):
    id = models.IntegerField(primary_key=True)
    cliente = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='cliente', blank=True, null=True)
    chasis = models.CharField(max_length=50, blank=True, null=True)
    matricula = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'vehiculo'

class Mecanico(models.Model):
    id = models.IntegerField(primary_key=True)
    persona = models.IntegerField(blank=True, null=True)
    taller = models.ForeignKey(Servicio, models.DO_NOTHING, db_column='taller', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mecanico'

class RevisionTecnica(models.Model):
    id = models.IntegerField(primary_key=True)
    vehiculo = models.ForeignKey('Vehiculo', models.DO_NOTHING, db_column='vehiculo', blank=True, null=True)
    mecanico = models.ForeignKey(Mecanico, models.DO_NOTHING, db_column='mecanico', blank=True, null=True)
    kilometraje_actual = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    fecha_revision = models.DateField(blank=True, null=True)
    fecha_proxima_revision = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'revision_tecnica'

class RevisionTecnicaDetalle(models.Model):
    revision_tecnica = models.ForeignKey(RevisionTecnica, models.DO_NOTHING, db_column='revision_tecnica', blank=True, null=True)
    repuesto = models.ForeignKey(Equipamiento, models.DO_NOTHING, db_column='repuesto', blank=True, null=True)
    precio = models.DecimalField(max_digits=65535, decimal_places=65535, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'revision_tecnica_detalle'

class FacturaServicio(models.Model):
    id = models.IntegerField(primary_key=True)
    revision_tecnica = models.ForeignKey('RevisionTecnica', models.DO_NOTHING, db_column='revision_tecnica', blank=True, null=True)
    fecha_emision = models.DateField(blank=True, null=True)
    total = models.DecimalField(max_digits=65535, decimal_places=65535, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'factura_servicio'