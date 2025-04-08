from django import template

register = template.Library()

@register.filter
def nombre_completo(diccionario):
    return f'{diccionario['nombre']} {diccionario['apellido']}'

@register.filter
def colorear_texto(estado): # activo, inactivo, pendiente, desconocido
    colores = {
        'activo': 'green',
        'inactivo': 'red',
        'pendiente': 'orange'
    }
    color = colores.get(estado.lower(), 'black')
    return f'<span style="color: {color};">{estado}</span>'

@register.filter
def colorear_categoria_nota(alumno): # activo, inactivo, pendiente, desconocido
    colores = {
           'insuficiente': 'red',
           'suficiente': 'orange',
           'bien': 'green',
           'notable': 'yellow',
           'sobresaliente': 'blue',
    }
    clasificacion = ""
    if alumno['nota'] >= 9:
        clasificacion = 'sobresaliente'
    elif alumno['nota'] >= 7:
        clasificacion = 'notable'
    elif alumno['nota'] >= 6:
        clasificacion = 'bien'
    elif alumno['nota'] >= 5:
        clasificacion = 'suficiente'
    else:
        clasificacion = 'insuficiente'

    #color = colores.get(clasificacion, 'black')
    color = colores[clasificacion]
    texto = f"El alumno {alumno['nombre']} con nota {alumno['nota']}"
    return f'<span style="color: {color};">{texto}</span>'

@register.filter
def producto(n,i):
    return n * i