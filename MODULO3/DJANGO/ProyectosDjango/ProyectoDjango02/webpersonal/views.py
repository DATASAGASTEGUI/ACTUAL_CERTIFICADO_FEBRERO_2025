from django.shortcuts import render

def index(request):
    return render(request, 'index.html')

def ejemplo01(request):
    nombre = "Walter"
    return render(request, 'ejemplo01.html', {'nombre': nombre})

def ejemplo02(request):
    diccionario = {
        'nombre': 'Gerson',
        'apellido': 'Gonzalez',
        'edad': 25,
        'estatura': 1.72,
        'hobbies': ['Leer', 'jugar', 'viajar', 'aprender', 'aprender', 'aprender', 'aprende'],
        'productos': [
             {'nombre': 'camisa', 'precio': 500},
             {'nombre': 'pantalon', 'precio': 300},
             {'nombre': 'zapatos', 'precio': 200},
         ]
    }
    return render(request, 'ejemplo02.html', diccionario)

def ejemplo03(request):
    alumnos = [
        {'nombre': 'Walter', 'edad': 25, 'aprobado': True},
        {'nombre': 'Gerson', 'edad': 26, 'aprobado': False}, 
        {'nombre': 'Luis', 'edad': 27, 'aprobado': False},
        {'nombre': 'Carlos', 'edad': 28, 'aprobado': True}
    ]
    return render(request, 'ejemplo03.html', {'alumnos': alumnos})

def ejemplo04(request):
    lista_productos = [
        {'nombre': 'camisa', 'precio': 500, 'impuesto': 0.19},
        {'nombre': 'pantalon', 'precio': 300, 'impuesto': 0.21},
        {'nombre': 'zapatos', 'precio': 200, 'impuesto': 0.10},
    ]
    return render(request, 'ejemplo04.html', {'lista_productos': lista_productos})

def ejemplo05(request):
    alumnos = [
        {'nombre': 'Walter', 'edad': 25, 'nota':7},
        {'nombre': 'Gerson', 'edad': 26, 'nota':9}, 
        {'nombre': 'Luis', 'edad': 27, 'nota':6}, 
        {'nombre': 'Carlos', 'edad': 28, 'nota':4}
    ]
    return render(request, 'ejemplo05.html', {'alumnos': alumnos})


