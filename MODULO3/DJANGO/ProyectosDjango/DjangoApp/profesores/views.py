from django.http import HttpResponse
from .models import Profesor

def lista_profesores(request):
    profesores = Profesor.objects.all()
    salida = ", ".join([f"{p.nombre} ({p.materia})" for p in profesores])
    return HttpResponse(f"Profesores: {salida}")
