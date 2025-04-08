from django.shortcuts import render
from .models import Alumno
from django.db.models import Q

def index(request):
    return render(request, "index.html")

def mostrar_alumnos(request):
    alumnos = Alumno.objects.all()
    diccionario = {"alumnos": alumnos}
    return render(request, "mostrar_alumnos.html", diccionario)

def actualizar_alumno(request, id):
    alumno = Alumno.objects.get(id=id)
    
    if request.method == "POST":
        alumno.nombre = request.POST.get("txt_nombre")
        alumno.direccion = request.POST.get("txt_direccion")
        alumno.estatura = request.POST.get("txt_estatura")
        alumno.save()
        diccionario = {"mensaje": "Alumno actualizado correctamente"}
        return render(request, "actualizar_alumno.html", diccionario)
    
    diccionario = {"alumno": alumno}
    return render(request, "actualizar_alumno.html", diccionario)

def eliminar_alumno(request, id):
    
    
    alumno = Alumno.objects.get(id=id)

    alumno.delete()
    alumnos = Alumno.objects.all()

    diccionario = {"alumnos": alumnos, "mensaje": "Alumno eliminado correctamente"}
    return render(request, "mostrar_alumnos.html", diccionario)
   




def insertar_alumnos(request):
    if request.method == "POST":
       nombre = request.POST.get("txt_nombre")
       direccion = request.POST.get("txt_direccion")
       estatura = request.POST.get("txt_estatura")
       nuevo_alumno = Alumno(nombre=nombre, direccion=direccion, estatura=estatura)
       nuevo_alumno.save()

       diccionario = {"mensaje": "Alumno insertado correctamente"}
       return render(request, "insert.html", diccionario)
    

    return render(request, "insert.html")

def buscar_por_talla(request):
    if request.method == "POST":
        talla_minima = float(request.POST.get("txt_estatura_minima"))
        talla_maxima = float(request.POST.get("txt_estatura_maxima"))
        alumnos = Alumno.objects.filter(estatura__gte=talla_minima, estatura__lte=talla_maxima) 
        diccionario = {"alumnos": alumnos}
        return render(request, "talla.html", diccionario)
    
    return render(request, "talla.html")

def buscar_por_nombre_o_talla(request):
    if request.method == "POST":
        nombre = request.POST.get("txt_nombre")
        talla = request.POST.get("txt_estatura")

        alumnos = Alumno.objects.filter(Q(nombre="Juan") | Q(estatura__gt=1.75))



        diccionario = {"alumnos": alumnos}
        return render(request, "buscar_nombre_o_talla.html", diccionario)

    return render(request, "buscar_nombre_o_talla.html")

def buscar_por_nombre_y_talla(request):
    if request.method == "POST":
        nombre = request.POST.get("txt_nombre")
        talla = request.POST.get("txt_estatura")

        alumnos = Alumno.objects.filter(Q(nombre=nombre) & Q(estatura__lt=float(talla)))

        diccionario = {"alumnos": alumnos}
        return render(request, "buscar_nombre_y_talla.html", diccionario)

    return render(request, "buscar_nombre_y_talla.html")

def buscar_por_id(request):
    alumnos = Alumno.objects.all()

    if request.method == "POST":
        alumno_id = request.POST.get("cbo_alumnos")
        alumno = Alumno.objects.get(id=alumno_id)
        
        diccionario = {"alumno_seleccionado": alumno, "alumnos": alumnos}
        return render(request, "buscar_id.html", diccionario)   

    diccionario = {"alumnos": alumnos}
    return render(request, "buscar_id.html", diccionario)