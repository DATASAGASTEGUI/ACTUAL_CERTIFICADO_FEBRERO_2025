from django.db import models

class Consulta(models.Model):
    numeroConsulta = models.CharField(max_length=10, primary_key=True)
    fecha = models.CharField(max_length=50)  # O models.CharField(max_length=...) si prefieres mantenerlo como texto fecha = models.DateField()
    nombreMedico = models.CharField(max_length=50)
    deinpr = models.CharField(max_length=20)
    procedencia = models.CharField(max_length=20)

    class Meta:
        db_table = 'Consulta'  # Esto mantendrá el nombre exacto de la tabla

    def __str__(self):
        return self.numeroConsulta
