
from django.http import HttpResponse
from django.shortcuts import render

def home(request):
    return HttpResponse("Hola Mundo")  

def inicio1(request):
    return render(request, 'inicio1.html')  

def inicio2(request):
    return render(request, 'inicio2.html') 

from django.shortcuts import render

def sumar(request):
    # Valores iniciales
    numero1 = ""
    numero2 = ""
    resultado = ""
    
    if request.method == 'POST':
        if 'cmdSumar' in request.POST:
            # Procesar suma
            numero1 = request.POST.get('txtNumero1', '')
            numero2 = request.POST.get('txtNumero2', '')
            try:
                suma = float(numero1) + float(numero2)
                resultado = str(suma)
            except (ValueError, TypeError):
                # Si hay error, limpiar los campos
                numero1 = ""
                numero2 = ""
                resultado = ""
        
        elif 'cmdNuevo' in request.POST:
            # Limpiar formulario
            numero1 = ""
            numero2 = ""
            resultado = ""
    
    return render(request, 'sumar.html', {
        'numero1': numero1,
        'numero2': numero2,
        'resultado': resultado
    })

