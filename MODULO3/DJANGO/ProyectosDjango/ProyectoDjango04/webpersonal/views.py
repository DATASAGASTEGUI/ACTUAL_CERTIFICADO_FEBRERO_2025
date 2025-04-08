from django.db import connections
from django.shortcuts import render
from django.http import HttpResponse
from django.db.models import F
from webpersonal.models import Cliente, Vendedor

from webpersonal.models import Cliente, Consulta

def index(request):
    return render(request, 'index.html')

def ejemplo01(request):
    # Obtener todas las consultas ordenadas por fecha (más reciente primero)
    #consultas = Consulta.objects.all().order_by('-fecha') 
    consultas = Consulta.objects.all()  # ORM = SELECT * FROM Consulta;
    # Pasar los datos al template
    context = {
        'consultas': consultas,
        'titulo': 'Listado de Consultas Médicas'
    }
    return render(request, 'ejemplo01.html', context)

def ejemplo02(request):
    consultas = Consulta.objects.all().order_by('-fecha') # ORM = SELECT * FROM Consulta ORDER BY fecha
    context = {
        'consultas': consultas,
        'titulo': 'Listado de Consultas Médicas'
    }
    return render(request, 'ejemplo02.html', context)

def ejemplo03(request):
    consultas = Consulta.objects.filter(nombreMedico__exact='JUAN ANTONIO LEON LUIS')
    print(consultas)
    context = {
        'consultas': consultas,
        'titulo': 'Listado de Consultas de un Médico'
    }
    return render(request, 'ejemplo03.html', context)

def ejemplo04(request):
    clientes = Cliente.objects.using('factoria_mysql').all()  # ORM = SELECT * FROM Cliente;
    context = {
        'clientes': clientes,
        'titulo': 'Listado de Clientes de la Factoria de MySQL'
    }
    return render(request, 'ejemplo04.html', context)


def ejemplo05(request):
    try:
        with connections['factoria_mysql'].cursor() as cursor:
             cursor.execute('SELECT * FROM cliente')
             clientes = cursor.fetchall() # Lista de tuplas
             
             lista_diccionario = []  # Lista de diccionarios
             for tupla_cliente in clientes:
                 lista_diccionario.append({
                     'idCliente': tupla_cliente[0],
                     'empresa': tupla_cliente[1],
                     'idVendedor': tupla_cliente[2],
                     'limite_credito': tupla_cliente[3]
                 })
             
             context = {
                'clientes': lista_diccionario,
                'titulo': 'Listado de Clientes de la Factoria de MySQL'
             }
             return render(request, 'ejemplo05.html', context)
    except Exception as e:
        print(e)    


    return render(request, 'ejemplo05.html')

def ejemplo06(request):
    context = {}
    id_cliente = ""; nombre_empresa = ""; mensaje = ""
    if request.method == 'POST':
        if 'cmdEmpresa' in request.POST:
            try:
                id_cliente = int(request.POST.get('txtIdCliente', 0))
                cliente = Cliente.objects.using('factoria_mysql').get(idCliente=id_cliente)
                if cliente:
                   context = {
                        'id_cliente': id_cliente,
                        'nombre_empresa': cliente.empresa,
                        'mensaje': 'OK'
                   }
                else:
                    context = {
                        'id_cliente': id_cliente,
                        'nombre_empresa': '',
                        'mensaje': 'Cliente no existe'
                   } 
            except Exception as e:
                context = {'mensaje': f'Error: {str(e)}'}
        elif 'cmdNuevo' in request.POST:
            context = {}  # Limpiar formulario
    return render(request, 'ejemplo06.html', context)

'''
def ejemplo06(request):
    context = {}
    if request.method == 'POST':
        if 'cmdEmpresa' in request.POST:
            try:
                id_cliente = int(request.POST.get('txtIdCliente', 0))
                try:
                    cliente = Cliente.objects.using('factoria_mysql').get(idCliente=id_cliente)
                    context = {
                        'id_cliente': id_cliente,
                        'nombre_empresa': cliente.empresa,
                        'mensaje': 'OK'
                    }
                except Cliente.DoesNotExist:
                    context = {
                        'mensaje': 'Cliente no encontrado',
                        'id_cliente': id_cliente
                    }
                    
            except ValueError:
                context = {'mensaje': 'Error: Debes ingresar un número válido'}
            except Exception as e:
                context = {'mensaje': f'Error: {str(e)}'}
                
        elif 'cmdNuevo' in request.POST:
            context = {}  # Limpiar formulario
    
    return render(request, 'ejemplo06.html', context)
'''

def ejemplo07(request):
    context = {}
    id_cliente = ""; nombre_empresa = ""; mensaje = ""
    if request.method == 'POST':
        if 'cmdEmpresa' in request.POST:
            try:
                id_cliente = int(request.POST.get('txtIdCliente', 0))
                cliente = Cliente.objects.using('factoria_sqlite').get(idCliente=id_cliente)
                if cliente:
                   context = {
                        'id_cliente': id_cliente,
                        'nombre_empresa': cliente.empresa,
                        'mensaje': 'OK'
                   }
                else:
                    context = {
                        'id_cliente': id_cliente,
                        'nombre_empresa': '',
                        'mensaje': 'Cliente no existe'
                   } 
            except Exception as e:
                context = {'mensaje': f'Error: {str(e)}'}
        elif 'cmdNuevo' in request.POST:
            context = {}  # Limpiar formulario
    return render(request, 'ejemplo07.html', context)

def ejemplo08(request):
    clientes_con_vendedor = Cliente.objects.using('factoria_mysql').select_related('idVendedor').annotate(
        nombre_vendedor=F('idVendedor__nombre'),
        oficina_vendedor=F('idVendedor__idOficina__ciudad')  # Ejemplo de campo adicional
    ).values(
        'idCliente',
        'empresa',
        'limite_credito',
        'nombre_vendedor',
        'idVendedor'  # Mantener el ID por si necesitas referencia
    )
    '''
    SELECT c.*, v.nombre 
    FROM Cliente c 
    INNER JOIN Vendedor v ON c.idVendedor = v.idVendedor;
    '''
    
    return render(request, 'ejemplo08.html', {'clientes': clientes_con_vendedor})

def ejemplo09(request):
    return render(request, 'ejemplo09.html')

def ejemplo10(request):
    return render(request, 'ejemplo10.html')
