from django.db import models

# Create your models here.
class Trabajador(models.Model):
      nombre = models.CharField(max_length=100)
      apellido = models.CharField(max_length=100)
      salario = models.DecimalField(max_digits=19,decimal_places=2)
      created_at = models.DateTimeField(auto_now_add=True)
      updated_at = models.DateTimeField(auto_now=True)
