from django.http import HttpResponse
from django.shortcuts import render

def home(request):
    return render(request, 'home.html')

def bienvenida(request):
    return HttpResponse("<h1>Hola Walter</h1>")

def muchas_bienvenidas(request):
    base = "<h1>Hola Walter</h1>"
    mensaje = ""
    for i in range(10):
        mensaje += base # mensaje = mensaje + base
    return HttpResponse(mensaje)

def sumar(request):
    numero1 = ""
    numero2 = ""
    resultado = ""
    if request.method == "POST":
        numero1 = request.POST.get('txtN1', '')
        numero2 = request.POST.get('txtN2', '')
        resultado = int(numero1) + int(numero2)

    return render(request, 'sumar.html',
                  {
                  'numero1': numero1,
                  'numero2': numero2,
                  'resultado': resultado
                  }
                 )