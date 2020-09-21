from django.db import models

class Servicio(models.Model):
    dni = models.TextField()
    nombre = models.TextField()
    domicilio = models.TextField()

class Marca(models.Model):
    nombre = models.TextField()
    
    def __str__(self):
        return self.nombre

class Auto(models.Model):
    bastidor = models.TextField(max_length=17)
    concesionario = models.ForeignKey(Servicio, blank=False, null=False, on_delete=models.PROTECT)
    potencia = models.DecimalField(max_digits=19, decimal_places=2)
    cilindraje = models.IntegerField()
    marca = models.ForeignKey(Marca, blank=False, null=False, on_delete=models.PROTECT)
    modelo = models.TextField()
    precio = models.DecimalField(max_digits=19, decimal_places=2)

# class Equipamiento(models.Model):
#     auto = models.ForeignKey(Auto, on_delete=models.CASCADE, null=False, blank=False)
#     nombre = models.TextField()
#     precio = models.DecimalField(max_digits=19, decimal_places=2)
#     deSerie = models.BooleanField()

    