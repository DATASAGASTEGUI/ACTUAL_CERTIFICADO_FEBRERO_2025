from django.http import HttpResponse
from .models import Alumno

def lista_alumnos(request):
    alumnos = Alumno.objects.all()
    salida = ", ".join([str(a.id) + ';' + a.nombre + ';' + str(a.edad) + ';' + a.grupo for a in alumnos])
    return HttpResponse(f"Alumnos: {salida}")


lista = [1, 2, 3, 4, 5]
pares = [n for n in lista if n % 2 == 0] # [2, 4]
