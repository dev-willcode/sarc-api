from django.db import models


class Usuario(models.Model):
    correo = models.CharField(max_length=255)
    contrasena = models.CharField(max_length=255)


class Persona(models.Model):
    dni = models.CharField(max_length=13, blank=True, null=True)
    nombre = models.CharField(max_length=50, blank=True, null=True)
    domicilio = models.CharField(max_length=50, blank=True, null=True)
    usuario = models.ForeignKey(
        Usuario, on_delete=models.PROTECT, null=False, blank=False)

    def __str__(self):
        return self.nombre


class Cliente(models.Model):
    persona = models.ForeignKey(
        Persona, on_delete=models.PROTECT, null=False, blank=False)


class Vendedor(models.Model):
    persona = models.ForeignKey(
        Persona, on_delete=models.PROTECT, null=False, blank=False)


class Servicio(models.Model):
    dni = models.CharField(max_length=13,)
    nombre = models.CharField(max_length=50, blank=True, null=True)
    domicilio = models.CharField(max_length=50, blank=True, null=True)
    tipo = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.nombre


class Marca(models.Model):
    descripcion = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.descripcion


class Equipamiento(models.Model):
    nombre = models.CharField(max_length=50, blank=True, null=True)
    precio = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.nombre


class ModeloAuto(models.Model):
    marca = models.ForeignKey(
        Marca, on_delete=models.PROTECT, null=False, blank=False)
    nombre_modelo = models.CharField(max_length=50, blank=True, null=True)
    potencia = models.DecimalField(max_digits=10, decimal_places=2)
    cilindraje = models.IntegerField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.nombre_modelo


class Auto(models.Model):
    bastidor = models.CharField(unique=True, max_length=17)
    modelo_auto = models.ForeignKey(
        ModeloAuto, on_delete=models.PROTECT, null=False, blank=False)
    concesionario = models.ForeignKey(
        Servicio, on_delete=models.PROTECT, null=False, blank=False)

    def __str__(self):
        return self.bastidor


class FacturaVenta(models.Model):
    numero_factura = models.CharField(max_length=17, blank=False, null=False)
    fecha_emision = models.DateField(blank=False, null=False)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    vendedor = models.ForeignKey(
        Vendedor, on_delete=models.PROTECT, null=False, blank=False)
    cliente = models.ForeignKey(
        Cliente, on_delete=models.PROTECT, null=False, blank=False)
    auto = models.ForeignKey(
        Auto, on_delete=models.PROTECT, null=False, blank=False)
    forma_pago = models.CharField(max_length=50, blank=True, null=True)
    matricula = models.CharField(max_length=8, blank=True, null=True)

    def __str__(self):
        return self.numero_factura
