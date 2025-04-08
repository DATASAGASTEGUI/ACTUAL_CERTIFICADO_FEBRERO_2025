
from django.db import models

class Alumno(models.Model):
      id        = models.AutoField(primary_key=True)
      nombre    = models.CharField(max_length=100)
      direccion = models.CharField(max_length=200)
      estatura  = models.FloatField()

      class Meta:
          db_table = "alumno"
          managed = False

      def __str__(self):
         return f"{self.id} {self.nombre} {self.direccion} {self.estatura}"
      

