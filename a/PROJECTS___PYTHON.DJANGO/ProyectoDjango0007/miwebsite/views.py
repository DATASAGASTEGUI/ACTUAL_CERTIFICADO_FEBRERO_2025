
import math
from django.http import HttpResponse
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

def resolver_ecuacion(request):
    resultado = None
    error = None

    if request.method == 'POST':
        try:
            a = float(request.POST['a'])
            b = float(request.POST['b'])
            c = float(request.POST['c'])

            discriminante = b ** 2 - 4 * a * c

            if discriminante > 0:
                x1 = (-b + math.sqrt(discriminante)) / (2 * a)
                x2 = (-b - math.sqrt(discriminante)) / (2 * a)
                resultado = f"Dos soluciones reales: x1 = {x1}, x2 = {x2}"
            elif discriminante == 0:
                x = -b / (2 * a)
                resultado = f"Una solución real doble: x = {x}"
            else:
                resultado = "No tiene soluciones reales."
        except Exception as e:
            error = f"Error: {str(e)}"

    return render(request, 'ecuacion_cuadratica.html', {'resultado': resultado, 'error': error})

def convertir_binario(request):
    resultado = None
    error = None
    decimal = ''

    if request.method == 'POST':
        try:
            decimal = request.POST.get('decimal', '')
            numero = int(decimal)
            resultado = bin(numero)[2:]  # quitamos el prefijo '0b'
        except ValueError:
            error = "Por favor ingresa un número entero válido."

    return render(request, 'decimal_to_binario.html', {
        'resultado': resultado,
        'decimal': decimal,
        'error': error
    })

def convertir_binario(request):
    resultado = None
    error = None
    decimal = ''

    if request.method == 'POST':
        try:
            decimal = request.POST.get('decimal', '')
            numero = int(decimal)
            resultado = bin(numero)[2:]  # quitamos el prefijo '0b'
        except ValueError:
            error = "Por favor ingresa un número entero válido."

    return render(request, 'decimal_to_binario.html', {
        'resultado': resultado,
        'decimal': decimal,
        'error': error
    })

from django.shortcuts import render

def convertir_binario_get(request):
    resultado = None
    error = None
    decimal = ''

    if 'decimal' in request.GET:
        try:
            decimal = request.GET.get('decimal', '')
            numero = int(decimal)
            resultado = bin(numero)[2:]
        except ValueError:
            error = "Por favor ingresa un número entero válido."

    return render(request, 'ecuacion/convertir.html', {
        'resultado': resultado,
        'decimal': decimal,
        'error': error
    })

def tabla_multiplicar_6(request):
    numero = 6
    resultados = [(numero, i, numero * i) for i in range(1, 11)]
    return render(request, 'tabla6.html', {'resultados': resultados})
	
	
	action="{{ url_for('sumar') }}