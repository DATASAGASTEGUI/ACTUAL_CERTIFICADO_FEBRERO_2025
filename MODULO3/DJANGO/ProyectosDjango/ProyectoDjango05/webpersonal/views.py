from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return render(request, 'index.html')

def ejemplo01(request):
    a = 0; b = 0; c = 0; x1 = 0; x2 = 0; mensaje = ""
    if request.method == 'POST':
       if 'cmdRaices' in request.POST:
          try:
            a = float(request.POST['txtA'])
            b = float(request.POST['txtB'])
            c = float(request.POST['txtC'])

            d = (b**2) - (4*a*c)

            x1 = (-b + d**0.5) / (2*a)
            x2 = (-b - d**0.5) / (2*a)
            mensaje = "OK"
          except:
             return render(request, 'error.html', {'mensaje': "Error: Entrada Incorrecta"}) 
            #x1 = 0; x2 = 0; mensaje = "Error: Entrada Incorrecta"
    return render(request, 'ejemplo01.html', {'a':a, 'b':b, 'c':c, 'x1':x1, 'x2':x2, 'mensaje': mensaje})


      

        
 


  

def ejemplo02(request):
    return render(request, 'ejemplo02.html')

def ejemplo03(request):
    return render(request, 'ejemplo03.html')

def ejemplo04(request):
    return render(request, 'ejemplo04.html')

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
