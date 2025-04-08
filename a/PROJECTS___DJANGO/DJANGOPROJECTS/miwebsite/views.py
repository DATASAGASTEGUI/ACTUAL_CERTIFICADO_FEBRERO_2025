from django.http import HttpResponse
from django.shortcuts import render
from trabajadores.models import Trabajador

# ------------------------------------------------------------------------------
def inicio(request):
    return render(request, 'inicio.html')

def administrador(request):
    return render(request, 'administrador.html')

def almacen(request):
    return render(request, 'almacen.html')

def caja(request):
    return render(request, 'caja.html')

def empleado(request):
    return render(request, 'empleado.html')

def publicidad(request):
    return render(request, 'publicidad.html')
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
def factura(request):
    return HttpResponse("""<h1 style='color: red;
                               font-weight: normal;font-size: 3em;
                               font-family: Courier New;
                               text-transform: uppercase;
                               text-align: center;'>Benvenido Factura</h1>""")

def limpieza(request):
    return HttpResponse("<h1>Bienvenido Limpieza</h1>")
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
def trabajador(request):
    trabajadores = Trabajador.objects.all()
    contexto = {
         'trabajadores' : trabajadores
    }
    return render(request, 'trabajador.html', contexto)
# ------------------------------------------------------------------------------

