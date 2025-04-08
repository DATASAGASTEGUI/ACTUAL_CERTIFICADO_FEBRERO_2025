from django.shortcuts import render
from django.http import HttpResponse

from webpersonal.models import Consulta

def index(request):
    return render(request, 'index.html')

# [01] Mostrar una variable
def ejemplo01(request):
    nombre = 'Gerson'
    return render(request, 'ejemplo01.html', {'nombre': nombre})

# [02] Mostrar un diccionario
def ejemplo02(request):
    datos = {
        'nombre': 'Gerson', 
        'apellido': 'Rabanal', 
        'edad': 22, 
        'hobbies': ['Futbol', 'Programación', 'Viaje'],
        'estatura': 1.75,
        'productos': [
            {'nombre': 'Laptop', 'precio': 1200},
            {'nombre': 'Mouse', 'precio': 30},
            {'nombre': 'Teclado', 'precio': 50}
        ]
    }
    return render(request, 'ejemplo02.html', datos)

# [03] Mostrar una lista
def ejemplo03(request):
    lista = [
        {'nombre': 'Teclado', 'precio': 25.99},
        {'nombre': 'Ratón', 'precio': 15.50},
        {'nombre': 'Monitor', 'precio': 149.00}
    ]
    return render(request, 'ejemplo03.html', {'productos': lista})

# [04] Validar un usuario (condicional binario)
def ejemplo04(request):
    context = {
        'usuario': {
            'is_autentico': True,
            'nombre_usuario': 'Juan Perez',
        }
    }
    return render(request, 'ejemplo04.html', context)

# [05] Mostrar una variable temporal {% with %}
def ejemplo05(request):
    producto = {
        'nombre': 'Smartphone',
        'precio': 800,
        'impuesto': 100,
    }
    return render(request, 'ejemplo05.html', {'producto': producto})

def ejemplo06(request):
    # Obtener todas las consultas ordenadas por fecha (más reciente primero)
    consultas = Consulta.objects.all().order_by('-fecha')
    
    # Pasar los datos al template
    context = {
        'consultas': consultas,
        'titulo': 'Listado de Consultas Médicas'
    }
    return render(request, 'ejemplo06.html', context)

def ejemplo07(request):
    return render(request, 'ejemplo07.html')

def ejemplo08(request):
    return render(request, 'ejemplo08.html')

def ejemplo09(request):
    return render(request, 'ejemplo09.html')

def ejemplo10(request):
    return render(request, 'ejemplo10.html')
