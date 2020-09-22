from django.db import models


class Servicio(models.Model):
    dni = models.TextField()
    nombre = models.TextField()
    domicilio = models.TextField()

    def __str__(self):
        return self.nombre


class Marca(models.Model):
    nombre = models.TextField()

    def __str__(self):
        return self.nombre


class Auto(models.Model):
    concesionario = models.ForeignKey(
        Servicio, blank=False, null=False, on_delete=models.PROTECT
    )
    potencia = models.DecimalField(max_digits=19, decimal_places=2)
    cilindraje = models.IntegerField()
    marca = models.ForeignKey(Marca, blank=False, null=False, on_delete=models.PROTECT)
    modelo = models.TextField()
    precio = models.DecimalField(max_digits=19, decimal_places=2)
    imagen = models.ImageField(upload_to='autos',null=True, blank=True)

    def __str__(self):
        return self.modelo


class Equipamiento(models.Model):
    auto = models.ForeignKey(Auto, on_delete=models.PROTECT, null=True, blank=True)
    nombre = models.TextField()
    precio = models.DecimalField(max_digits=19, decimal_places=2)
    deSerie = models.BooleanField()
    imagen = models.ImageField(upload_to='equipamiento', null=True, blank=True)

    def __str__(self):
        return self.nombre
