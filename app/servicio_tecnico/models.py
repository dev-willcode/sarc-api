from django.db import models
from app.inventario.models import Cliente, Usuario, Servicio, Equipamiento


class Vehiculo(models.Model):
    cliente = models.ForeignKey(
        Cliente, on_delete=models.PROTECT, null=False, blank=False)
    chasis = models.CharField(max_length=50, blank=False, null=False)
    matricula = models.CharField(max_length=50, blank=False, null=False)

    def __str__(self):
        return self.matricula


class Mecanico(models.Model):
    dni = models.CharField(max_length=13, blank=False, null=False)
    nombre = models.CharField(max_length=50, blank=False, null=False)
    domicilio = models.CharField(max_length=50, blank=False, null=False)
    correo = models.CharField(blank=False, null=False, max_length=255)
    usuario = models.ForeignKey(
        Usuario, on_delete=models.SET_NULL, null=True, blank=True)
    taller = models.ForeignKey(
        Servicio, on_delete=models.PROTECT, null=False, blank=False)


class Citas(models.Model):
    cliente = models.ForeignKey(
        Cliente, on_delete=models.PROTECT, null=False, blank=False)
    mecanico = models.ForeignKey(
        Mecanico, on_delete=models.PROTECT, null=False, blank=False)
    fecha = models.DateField(blank=False, null=False)


class Repuestos(models.Model):
    nombre = models.CharField(max_length=50, blank=False, null=False)
    precio = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.nombre


class RevisionTecnica(models.Model):
    vehiculo = models.ForeignKey(
        Vehiculo, on_delete=models.PROTECT, null=False, blank=False)
    mecanico = models.ForeignKey(
        Mecanico, on_delete=models.PROTECT, null=False, blank=False)
    cliente = models.ForeignKey(
        Cliente, on_delete=models.PROTECT, null=False, blank=False)
    fecha_revision = models.DateField(blank=False, null=False)
    fecha_proxima_revision = models.DateField(blank=False, null=False)
    kilometraje_actual = models.DecimalField(max_digits=10, decimal_places=2)
    costo_revision = models.DecimalField(max_digits=10, decimal_places=2)


class RevisionTecnicaDetalle(models.Model):
    revision_tecnica = models.ForeignKey(
        RevisionTecnica, on_delete=models.PROTECT, null=False, blank=False)
    descripcion = models.CharField(max_length=50, blank=False, null=False)
    precio = models.DecimalField(max_digits=10, decimal_places=2)


class FacturaServicio(models.Model):
    fecha_emision = models.DateField(blank=False, null=False)
    cliente = models.ForeignKey(
        Cliente, on_delete=models.PROTECT, null=False, blank=False)

    def __str__(self):
        return self.numero_factura


class FacturaServicioDetalle(models.Model):
    factura = models.ForeignKey(FacturaServicio, related_name='detalle_servicio',
                                on_delete=models.CASCADE, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=False, null=False)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
