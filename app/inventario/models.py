from django.db import models

class Usuario(models.Model):
    correo = models.CharField(unique=True, blank=False, null=False, max_length=255)
    contrasena = models.CharField(blank=False, null=False, max_length=255)

class Cliente(models.Model):
    dni = models.CharField(max_length=13, blank=False, null=False)
    nombre = models.CharField(max_length=50, blank=False, null=False)
    domicilio = models.CharField(max_length=50, blank=False, null=False)
    correo = models.CharField(blank=False, null=False, max_length=255)
    usuario = models.ForeignKey(
        Usuario, on_delete=models.PROTECT, null=True, blank=True)


class Vendedor(models.Model):
    dni = models.CharField(max_length=13, blank=False, null=False)
    nombre = models.CharField(max_length=50, blank=False, null=False)
    domicilio = models.CharField(max_length=50, blank=False, null=False)
    correo = models.CharField(blank=False, null=False, max_length=255)
    usuario = models.ForeignKey(
        Usuario, on_delete=models.PROTECT, null=True, blank=True)


class Servicio(models.Model):
    dni = models.CharField(max_length=13,)
    nombre = models.CharField(max_length=50, blank=False, null=False)
    domicilio = models.CharField(max_length=50, blank=False, null=False)
    tipo = models.CharField(max_length=50, blank=False, null=False)

    def __str__(self):
        return self.nombre


class Marca(models.Model):
    descripcion = models.CharField(max_length=50, blank=False, null=False)

    def __str__(self):
        return self.descripcion


class Equipamiento(models.Model):
    nombre = models.CharField(max_length=50, blank=False, null=False)
    precio = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.nombre


class ModeloAuto(models.Model):
    marca = models.ForeignKey(
        Marca, on_delete=models.PROTECT, null=False, blank=False)
    nombre_modelo = models.CharField(max_length=50, blank=False, null=False)
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
    imagen = models.ImageField(upload_to='autos',null=True, blank=True)
    
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
    forma_pago = models.CharField(max_length=50, blank=False, null=False)
    matricula = models.CharField(max_length=8, blank=False, null=False)

    def __str__(self):
        return self.numero_factura
