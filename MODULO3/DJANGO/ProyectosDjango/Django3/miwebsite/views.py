

from datetime import datetime
from django.http import HttpResponse
from django.shortcuts import render
from django.utils.timezone import make_aware

def index(request):
    return render(request, "index.html")

def radiobutton(request):
    temperatura = ''
    opcion = ''
    resultado = ''

    if request.method == "POST":
        if "btn_convertir" in request.POST:
            temperatura = request.POST.get("txt_temperatura")
            opcion = request.POST.get("rdo_opcion")
            if opcion == "c_to_f":
                resultado = round(((float(temperatura) * 9/5) + 32),2)
                resultado = f"{temperatura}°C = {resultado}°F"
            elif opcion == "f_to_c":
                resultado = round(((float(temperatura) - 32) * 5/9),2)
                resultado = f"{temperatura}°F = {resultado}°C"
        else:
            temperatura = ''
            opcion = ''
            resultado = ''

    didccionario = {
        "temperatura": temperatura,
        "opcion": opcion,
        "resultado": resultado
    }
    return render(request, "radiobutton.html", didccionario)

def combobox(request):
    temperatura = ''
    opcion = ''
    resultado = ''

    if request.method == "POST":
        if "btn_convertir" in request.POST:
            temperatura = request.POST.get("txt_temperatura")
            opcion = request.POST.get("cmb_opcion")
            if opcion == "c_to_f":
                resultado = round(((float(temperatura) * 9/5) + 32),2)
                resultado = f"{temperatura}°C = {resultado}°F"
            elif opcion == "f_to_c":
                resultado = round(((float(temperatura) - 32) * 5/9),2)
                resultado = f"{temperatura}°F = {resultado}°C"
        else:
            temperatura = ''
            opcion = ''
            resultado = ''

    didccionario = {
        "temperatura": temperatura,
        "opcion": opcion,
        "resultado": resultado
    }
    return render(request, "combobox.html", didccionario)

def checkbox(request):
    if request.method == "POST":
        # Recupera todos los valores seleccionados como lista
        seleccionados = request.POST.getlist("chk_opciones")
        
        # Ejemplo: devolver los valores seleccionados
        return HttpResponse(f"Seleccionaste: {', '.join(seleccionados)}")
    
    return render(request, "checkbox.html")

def date(request):
    if request.method == "POST":
        # Recupera todos los valores seleccionados como lista
        fecha_str = request.POST.get("date_nacimiento")
        fecha_nacimiento = datetime.strptime(fecha_str, "%Y-%m-%d")
        fecha_nacimiento = make_aware(fecha_nacimiento)
        fecha_ahora = datetime.now().astimezone()
        #diferencia = fecha_ahora - fecha_nacimiento
        edad = fecha_ahora.year - fecha_nacimiento.year
        meses = abs(fecha_ahora.month - fecha_nacimiento.month)
        dias = abs(fecha_ahora.day - fecha_nacimiento.day)
    
            
        diccionario = {
            "fecha_nacimiento": fecha_nacimiento,
            "edad": edad,
            "meses": meses,
            "dias": dias
        }
        return render(request, "date.html", diccionario)

    return render(request, "date.html")
