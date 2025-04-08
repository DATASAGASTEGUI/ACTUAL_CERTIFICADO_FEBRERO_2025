from django.db import models

class Consulta(models.Model):
    numeroConsulta = models.CharField(max_length=10, primary_key=True)
    fecha = models.CharField(max_length=50)  # O models.CharField(max_length=...) si prefieres mantenerlo como texto fecha = models.DateField()
    nombreMedico = models.CharField(max_length=50)
    deinpr = models.CharField(max_length=20)
    procedencia = models.CharField(max_length=20)

    class Meta:
        db_table = 'Consulta'  # Esto mantendrá el nombre exacto de la tabla
        managed = False  # Para que Django no gestione la tabla (ya existe)

    def __str__(self):
        return self.numeroConsulta
    

# Modelo para la tabla Cliente (usará la base de datos ferreteria)
class Cliente(models.Model):
    idCliente = models.AutoField(primary_key=True)
    empresa = models.CharField(max_length=255)
    idVendedor = models.IntegerField()  # Como no tenemos el modelo Vendedor, usamos IntegerField
    limite_credito = models.DecimalField(max_digits=10, decimal_places=2)
    
    class Meta:
        db_table = 'Cliente'  # Nombre exacto de tu tabla
        managed = False  # Para que Django no gestione la tabla (ya existe)
    
    def __str__(self):
        return f"{self.empresa} (Crédito: {self.limite_credito})"
    
class Alumno(models.Model):
    id_alumno = models.CharField(max_length=8, primary_key=True)
    nombre_alumno = models.CharField(max_length=50)
    curso = models.CharField(max_length=6)
    fecha_matricula = models.DateField()

    class Meta:
        db_table = 'Alumno'  # Nombre exacto de la tabla en MySQL
        managed = False  # Para que Django no gestione la tabla (ya existe)
    
    def __str__(self):
        return f"{self.nombre_alumno} ({self.id_alumno})"