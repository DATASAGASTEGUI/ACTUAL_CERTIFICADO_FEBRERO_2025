import datetime
from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return render(request, 'index.html')

def ejemplo01(request):
    personas = [
        {'nombre': 'juan', 'apellido': 'pérez'},
        {'nombre': 'ana', 'apellido': 'gómez'},
        {'nombre': 'luis', 'apellido': 'fernández'}
    ]
    return render(request, 'ejemplo01.html', {'personas': personas})

def ejemplo02(request):
    usuarios = [
        {'nombre': 'Juan', 'estado': 'activo'},
        {'nombre': 'Ana', 'estado': 'inactivo'},
        {'nombre': 'Luis', 'estado': 'pendiente'},
        {'nombre': 'Carla', 'estado': 'desconocido'},
    ]
    return render(request, 'ejemplo02.html', {'usuarios': usuarios})

def ejemplo03(request):
    personas = [
        {"nombre": "Juan", "precio": 100},
        {"nombre": "Ana", "precio": 150.5},
        {"nombre": "Luis", "precio": 200},
    ]
    return render(request, 'ejemplo03.html', {'personas': personas})

def ejemplo04(request):
    personas = [
        "juan perez",
        "maria lopez",
        "ana garcía",
        "carlos martínez"
    ]
    return render(request, 'ejemplo04.html', {'personas': personas})

def ejemplo05(request):
    personas = [
        {'nombre': 'Juan', 'anio_nacimiento': 1990},
        {'nombre': 'María', 'anio_nacimiento': 1985},
        {'nombre': 'Carlos', 'anio_nacimiento': 2000},
    ]
    return render(request, 'ejemplo05.html', {'personas': personas})

def ejemplo06(request):
    lista_productos = [
        {'nombre': 'Monitor', 'precio': 200.00, 'impuesto': 0.21},
        {'nombre': 'Teclado', 'precio': 50.00, 'impuesto': 0.10},
        {'nombre': 'Ratón', 'precio': 30.00, 'impuesto': 0.15},
    ]
    return render(request, 'ejemplo06.html', {'lista_productos': lista_productos})

def ejemplo07(request):
    fecha_nacimiento = datetime.date(2005, 7, 29)
    nombres = ["Ana", "Luis", "Pedro"]
    usuario = {"nombre": None}
    nombre = "maria perez"
    descripcion = "Este producto es muy bueno y recomendado."
    colores = ["rojo", "verde", "azul"]
    precio = 19.456
    activo = True
    nombres1 = ["Ana", "Luis", "Pedro", "Juan"]
    personas = [
    {"nombre": "Luis", "edad": 20},
    {"nombre": "Ana", "edad": 25},
]
    return render(request, 'ejemplo07.html', {'fecha_nacimiento': fecha_nacimiento, 'nombres': nombres, 'usuario': usuario, 'nombre': nombre, 'descripcion': descripcion, 'colores': colores, 'precio': precio, 'activo': activo, 'nombres1': nombres, 'personas': personas})

def ejemplo08(request):
    return render(request, 'ejemplo08.html')

def ejemplo09(request):
    return render(request, 'ejemplo09.html')

def ejemplo10(request):
    return render(request, 'ejemplo10.html')
