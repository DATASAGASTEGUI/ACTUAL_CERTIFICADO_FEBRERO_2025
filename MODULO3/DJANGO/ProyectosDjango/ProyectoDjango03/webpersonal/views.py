from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return render(request, 'index.html')

def ejemplo01(request):
    lista = [
       {'nombre': 'Luis', 'apellido': 'Perez'},
       {'nombre': 'Juan', 'apellido': 'Gomez'},
       {'nombre': 'Pedro', 'apellido': 'Alva'},
       {'nombre': 'Maria',  'apellido': 'Prado'},
    ]

    return render(request, 'ejemplo01.html', {'lista': lista})

def ejemplo02(request):
    usuarios = [
        {'nombre': 'Luis', 'estado': 'activo'},
        {'nombre': 'Juan', 'estado': 'inactivo'},
        {'nombre': 'Pedro', 'estado': 'pendiente'},
        {'nombre': 'Maria',  'estado': 'desconocido'},
    ]
    return render(request, 'ejemplo02.html', {'usuarios': usuarios})

def ejemplo03(request):
    alumnos = [
        {'nombre': 'Walter', 'edad': 25, 'nota':7},
        {'nombre': 'Gerson', 'edad': 26, 'nota':9}, 
        {'nombre': 'Luis', 'edad': 27, 'nota':6}, 
        {'nombre': 'Carlos', 'edad': 28, 'nota':4}
    ]
    return render(request, 'ejemplo03.html', {'alumnos': alumnos})

def ejemplo04(request):
    rango = range(1,13)
    return render(request, 'ejemplo04.html', {'rango': rango})

def ejemplo05(request):
    return render(request, 'ejemplo05.html')

def ejemplo06(request):
    return render(request, 'ejemplo06.html')

def ejemplo07(request):
    return render(request, 'ejemplo07.html')

def ejemplo08(request):
    return render(request, 'ejemplo08.html')

def ejemplo09(request):
    return render(request, 'ejemplo09.html')

def ejemplo10(request):
    return render(request, 'ejemplo10.html')
