

from django.shortcuts import render
from .models import Alumno

def index(request):
    return render(request, 'index.html')

def mostrar_alumnos(request):
    alumnos = Alumno.objects.all()
    return render(request, 'mostrar_alumnos.html', {'alumnos': alumnos})