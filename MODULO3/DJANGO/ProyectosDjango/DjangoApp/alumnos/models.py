from django.db import models

# Create your models here.

class Alumno(models.Model):
    nombre = models.CharField(max_length=100)
    edad = models.IntegerField()
    grupo = models.CharField(max_length=50)

    def __str__(self):
        return str(self.id) + '   -   ' + self.nombre + '  -   ' + str(self.edad) + '   -   ' + self.grupo