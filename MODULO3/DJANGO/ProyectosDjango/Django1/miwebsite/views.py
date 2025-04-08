from django.http import HttpResponse
from django.shortcuts import render

def home(request):  # http://127.0.0.1:8090
    return render(request, 'home.html')

def suma(request): # http://127.0.0.1:8090/suma/
    numero1 = ''
    numero2 = ''
    resultado = ''
    error = '' # false
    if request.method == 'POST':
       if 'btn_sumar' in request.POST:
          numero1 = request.POST.get('txt_numero1','')
          numero2 = request.POST.get('txt_numero2','')
          try:
             resultado = float(numero1) + float(numero2)
             resultado = round(resultado,2)
          except ValueError:
             error = "Por favor, ingrese valores numericos" # true
       else:
          numero1 = ''
          numero2 = ''
          resultado = ''
          error = '' # false  
    return render(request, 'suma.html', {
       'numero1': numero1,
       'numero2': numero2,
       'resultado': resultado,
       'error': error
    })

def suma_number(request): # http://127.0.0.1:8090/suma/
    numero1 = ''
    numero2 = ''
    resultado = ''
    error = '' # false
    if request.method == 'POST':
       if 'btn_sumar' in request.POST:
          numero1 = request.POST.get('txt_numero1','')
          numero2 = request.POST.get('txt_numero2','')
          resultado = float(numero1) + float(numero2)
          resultado = round(resultado,2)
       else:
          numero1 = ''
          numero2 = ''
          resultado = ''
          error = '' # false  
    return render(request, 'suma_number.html', {
       'numero1': numero1,
       'numero2': numero2,
       'resultado': resultado
    })