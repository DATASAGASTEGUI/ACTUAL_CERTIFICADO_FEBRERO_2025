from django.contrib import messages
from django.db import connection
from django.shortcuts import render
from django.http import HttpResponse

from django.db import connections, DatabaseError

from webpersonal.models import Alumno, Cliente, Consulta

from django.shortcuts import render, redirect

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
    # Obtenemos todos los clientes ordenados por empresa
    clientes = Cliente.objects.using('ferreteria').all().order_by('empresa')
    return render(request, 'ejemplo02.html', {'clientes': clientes})

def ejemplo03(request):
    # Obtenemos todos los clientes ordenados por empresa desde MySQL
    clientes = Cliente.objects.using('ferreteria_mysql').all().order_by('empresa')
    return render(request, 'ejemplo03.html', {'clientes': clientes})

def ejemplo04(request):
    # Obtenemos todos los alumnos ordenados por nombre
    alumnos = Alumno.objects.using('matricula_mysql').all().order_by('nombre_alumno')
    
    context = {
        'alumnos': alumnos,
        'titulo': 'Listado de Alumnos Matriculados'
    }
    return render(request, 'ejemplo04.html', context)

from django.db import connections  # Importar connections en lugar de connection
from django.shortcuts import render
from django.http import HttpResponse

def ejemplo05(request):
    try:
        # Usamos la conexión específica 'matricula_mysql'
        with connections['matricula_mysql'].cursor() as cursor:
            # Consulta SQL directa
            cursor.execute("""
                SELECT id_alumno, nombre_alumno, curso, fecha_matricula 
                FROM Alumno 
                ORDER BY nombre_alumno
            """)
            # Obtener todos los resultados
            rows = cursor.fetchall()
        
        # Preparar los datos para el template
        alumnos = []
        for row in rows:
            alumnos.append({
                'id_alumno': row[0],
                'nombre_alumno': row[1],
                'curso': row[2],
                'fecha_matricula': row[3]
            })
        
        return render(request, 'ejemplo05.html', {
            'alumnos': alumnos,
            'titulo': 'Listado de Alumnos (Consulta SQL Directa)'
        })
    
    except Exception as e:
        return HttpResponse(f"Error al acceder a la base de datos: {str(e)}")

def ejemplo06(request):
    try:
        # Verificar si hay conexión a la base de datos 'matricula_mysql'
        connection = connections['matricula_mysql']
        connection.ensure_connection()  # Lanza una excepción (DatabaseError) si no puede conectar (por ejemplo, si el servidor de base de datos está apagado, mal configurado, etc.).

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id_alumno, nombre_alumno, curso, fecha_matricula 
                FROM Alumno 
                ORDER BY nombre_alumno
            """)
            rows = cursor.fetchall()

        alumnos = []
        for row in rows:
            alumnos.append({
                'id_alumno': row[0],
                'nombre_alumno': row[1],
                'curso': row[2],
                'fecha_matricula': row[3]
            })

        return render(request, 'ejemplo06.html', {
            'alumnos': alumnos,
            'titulo': 'Listado de Alumnos (Consulta SQL Directa)'
        })

    except DatabaseError as db_error:
        return HttpResponse(f"Error de conexión a la base de datos: {str(db_error)}")
    except Exception as e:
        return HttpResponse(f"Error inesperado: {str(e)}")
    
'''
from django.shortcuts import render
from django.http import HttpResponse
from django.db import connections, DatabaseError
from .models import Alumno

def ejemplo06(request):
    try:
        # Configurar el router para usar la base de datos 'matricula_mysql'
        # Esto requiere configuración adicional en settings.py
        
        # Obtener todos los alumnos usando ORM
        alumnos = Alumno.objects.using('matricula_mysql').all()
        
        # Convertir a lista de diccionarios (opcional, solo si necesitas mantener compatibilidad)
        alumnos_data = [{
            'id_alumno': alumno.id_alumno,
            'nombre_alumno': alumno.nombre_alumno,
            'curso': alumno.curso,
            'fecha_matricula': alumno.fecha_matricula
        } for alumno in alumnos]

        return render(request, 'ejemplo06.html', {
            'alumnos': alumnos_data,
            'titulo': 'Listado de Alumnos (Usando ORM de Django)'
        })

    except DatabaseError as db_error:
        return HttpResponse(f"Error de conexión a la base de datos: {str(db_error)}")
    except Exception as e:
        return HttpResponse(f"Error inesperado: {str(e)}")
'''

def ejemplo07(request):
    try:
        # Verifica la conexión a la base de datos
        connection = connections['matricula_mysql']
        connection.ensure_connection()

        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id_alumno, nombre_alumno, curso, fecha_matricula 
                FROM Alumno 
                ORDER BY nombre_alumno
            """)
            rows = cursor.fetchall()

        alumnos = []
        for row in rows:
            alumnos.append({
                'id_alumno': row[0],
                'nombre_alumno': row[1],
                'curso': row[2],
                'fecha_matricula': row[3]
            })

        return render(request, 'ejemplo07.html', {
            'alumnos': alumnos,
            'titulo': 'Listado de Alumnos (Consulta SQL Directa)'
        })

    except DatabaseError as db_error:
        return render(request, 'error_bd.html', {
            'mensaje_error': f"Error de conexión a la base de datos: {str(db_error)}"
        })
    except Exception as e:
        return render(request, 'error_bd.html', {
            'mensaje_error': f"Error inesperado: {str(e)}"
        })
'''
def ejemplo07(request):
    try:
        # Obtenemos todos los alumnos ordenados por nombre (usando ORM)
        alumnos = Alumno.objects.all()  # Ya está ordenado por nombre_alumno por el Meta.ordering
        
        # Convertimos a lista de diccionarios para mantener compatibilidad con el template original
        alumnos_data = [{
            'id_alumno': alumno.id_alumno,
            'nombre_alumno': alumno.nombre_alumno,
            'curso': alumno.curso,
            'fecha_matricula': alumno.fecha_matricula
        } for alumno in alumnos]

        return render(request, 'ejemplo07.html', {
            'alumnos': alumnos_data,  # Puedes pasar directamente 'alumnos' si modificas el template
            'titulo': 'Listado de Alumnos (Usando ORM de Django)'
        })

    except Exception as e:
        return render(request, 'error_bd.html', {
            'mensaje_error': f"Error: {str(e)}"
        })
Mejoras adicion

'''

# consultas_medicos.html = ejemplo08.html
def ejemplo08(request):
    # Obtener todos los nombres distintos de médicos
    with connection.cursor() as cursor:
        cursor.execute("SELECT DISTINCT nombreMedico FROM Consulta ORDER BY nombreMedico")
        medicos = [row[0] for row in cursor.fetchall()]
    
    consultas = []
    medico_seleccionado = None
    
    if request.method == 'POST' and 'medico' in request.POST:
        medico_seleccionado = request.POST['medico']
        with connection.cursor() as cursor:
            cursor.execute(
                "SELECT numeroConsulta, fecha, nombreMedico, deinpr, procedencia FROM Consulta WHERE nombreMedico = %s ORDER BY fecha DESC",
                [medico_seleccionado]
            )
            columns = [col[0] for col in cursor.description]
            consultas = [dict(zip(columns, row)) for row in cursor.fetchall()]
    
    return render(request, 'ejemplo08.html', {
        'medicos': medicos,
        'consultas': consultas,
        'medico_seleccionado': medico_seleccionado
    })

'''
from django.shortcuts import render
from .models import Consulta  # Asegúrate de importar tu modelo

def ejemplo08(request):
    # Obtener todos los nombres distintos de médicos usando ORM
    medicos = Consulta.objects.order_by('nombreMedico').values_list('nombreMedico', flat=True).distinct()
    
    consultas = []
    medico_seleccionado = None
    
    if request.method == 'POST' and 'medico' in request.POST:
        medico_seleccionado = request.POST['medico']
        # Obtener consultas del médico seleccionado usando ORM
        consultas = Consulta.objects.filter(
            nombreMedico=medico_seleccionado
        ).order_by('-fecha')
    
    return render(request, 'ejemplo08.html', {
        'medicos': medicos,
        'consultas': consultas,
        'medico_seleccionado': medico_seleccionado
    })



# REGISTRAR_CONSULTA.html = ejemplo09.html
def ejemplo09(request):
    if request.method == 'POST':
        try:
            numeroConsulta = request.POST.get('numeroConsulta')
            fecha = request.POST.get('fecha')
            nombreMedico = request.POST.get('nombreMedico')
            deinpr = request.POST.get('deinpr')
            procedencia = request.POST.get('procedencia')

            with connection.cursor() as cursor:
                cursor.execute(
                    "INSERT INTO Consulta (numeroConsulta, fecha, nombreMedico, deinpr, procedencia) "
                    "VALUES (%s, %s, %s, %s, %s)",
                    [numeroConsulta, fecha, nombreMedico, deinpr, procedencia]
                )
            messages.success(request, 'Consulta registrada exitosamente!')
            return redirect('ejemplo09')
        except Exception as e:
            messages.error(request, f'Error al registrar la consulta: {str(e)}')

    return render(request, 'ejemplo09.html')

'''
def ejemplo09(request):
    if request.method == 'POST':
        try:
            # Crear y guardar la consulta usando el ORM
            Consulta.objects.create(
                numeroConsulta=request.POST.get('numeroConsulta'),
                fecha=request.POST.get('fecha'),
                nombreMedico=request.POST.get('nombreMedico'),
                deinpr=request.POST.get('deinpr'),
                procedencia=request.POST.get('procedencia')
            )
            messages.success(request, 'Consulta registrada exitosamente!')
            return redirect('ejemplo09')
        except Exception as e:
            messages.error(request, f'Error al registrar la consulta: {str(e)}')

    return render(request, 'ejemplo09.html')

'''

def listar_consultas(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Consulta ORDER BY fecha DESC")
        consultas = cursor.fetchall()
    return render(request, 'listar_consultas.html', {'consultas': consultas})

def ejemplo10(request):
    return render(request, 'ejemplo10.html')
