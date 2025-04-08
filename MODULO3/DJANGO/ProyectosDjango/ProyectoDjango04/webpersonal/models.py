from django.db import models

class Consulta(models.Model):
    numeroConsulta = models.CharField(max_length=10, primary_key=True)
    fecha = models.CharField(max_length=12)  # O models.CharField(max_length=...) si prefieres mantenerlo como texto fecha = models.DateField()
    nombreMedico = models.CharField(max_length=50)
    deinpr = models.CharField(max_length=20)
    procedencia = models.CharField(max_length=20)

    class Meta:
        db_table = 'Consulta'  # Esto mantendrá el nombre exacto de la tabla
        managed = False  # Para que Django no gestione la tabla (ya existe)

    def __str__(self):
        return f"{self.numeroConsulta} {self.fecha} {self.nombreMedico} {self.deinpr} {self.procedencia}" 

class Director(models.Model):
    idDirector = models.AutoField(primary_key=True)
    # Agregaría más campos relevantes para un director si existen en la BD
    
    class Meta:
        db_table = 'Director'
        verbose_name = 'Director'
        verbose_name_plural = 'Directores'

    def __str__(self):
        return f"Director {self.idDirector}"


class Oficina(models.Model):
    idOficina = models.AutoField(primary_key=True)
    ciudad = models.CharField(max_length=20)
    region = models.CharField(max_length=20)
    objetivo = models.DecimalField(max_digits=12, decimal_places=2)
    ventas = models.DecimalField(max_digits=12, decimal_places=2)
    
    idDirector = models.ForeignKey(
        Director,
        on_delete=models.CASCADE,
        db_column='idDirector'
    )

    class Meta:
        db_table = 'Oficina'
        verbose_name = 'Oficina'
        verbose_name_plural = 'Oficinas'
        indexes = [
            models.Index(fields=['ciudad']),
            models.Index(fields=['region']),
            models.Index(fields=['idDirector']),
        ]

    def __str__(self):
        return f"Oficina {self.idOficina} - {self.ciudad}, {self.region}"


class Vendedor(models.Model):
    idVendedor = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)  # Aumenté el tamaño
    edad = models.PositiveIntegerField()
    titulo = models.CharField(max_length=50)  # Aumenté el tamaño
    contrato = models.DateField()
    cuota = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    ventas = models.DecimalField(max_digits=12, decimal_places=2)
    
    idOficina = models.ForeignKey(
        Oficina,
        on_delete=models.SET_NULL,  # Cambié a SET_NULL para no perder datos si se borra la oficina
        null=True,
        blank=True,
        db_column='idOficina'
    )
    
    idVendedorJefe = models.ForeignKey(
        'self',
        on_delete=models.SET_NULL,  # Cambié a SET_NULL
        null=True,
        blank=True,
        db_column='idVendedorJefe'
    )

    class Meta:
        db_table = 'Vendedor'
        verbose_name = 'Vendedor'
        verbose_name_plural = 'Vendedores'
        indexes = [
            models.Index(fields=['nombre']),
            models.Index(fields=['idOficina']),
            models.Index(fields=['idVendedorJefe']),
        ]

    def __str__(self):
        return f"{self.nombre} (ID: {self.idVendedor})"


class Cliente(models.Model):
    idCliente = models.AutoField(primary_key=True)
    empresa = models.CharField(max_length=255)
    idVendedor = models.ForeignKey(
        Vendedor,
        on_delete=models.SET_NULL,  # Cambié a SET_NULL
        null=True,
        blank=True,
        db_column='idVendedor'
    )
    limite_credito = models.DecimalField(max_digits=12, decimal_places=2)
    
    class Meta:
        db_table = 'Cliente'
        verbose_name = 'Cliente'
        verbose_name_plural = 'Clientes'
        indexes = [
            models.Index(fields=['empresa']),
            models.Index(fields=['idVendedor']),
        ]
    
    def __str__(self):
        return f"{self.empresa} (ID: {self.idCliente})"