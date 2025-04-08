from datetime import datetime
from django import template

register = template.Library()

@register.filter
def nombre_completo(persona):
    return f"{persona['nombre']} {persona['apellido']}".title()

@register.filter
def estado_color(estado):
    colores = {
        "activo": "green",
        "inactivo": "gray",
        "pendiente": "orange"
    }
    color = colores.get(estado.lower(), "black")
    return f'<span style="color:{color}">{estado.title()}</span>'

    #estado_color.is_safe = True  # Permite que el HTML generado no sea escapado

@register.filter
def aplicar_iva(precio):
    return precio * 1.21

@register.filter
def capitalizar(texto):
    return ' '.join([palabra.capitalize() for palabra in texto.split()])

@register.filter
def calcular_edad(anio_nacimiento):
    actual = datetime.now().year
    return actual - anio_nacimiento

@register.filter
def total_con_impuesto(producto):
    try:
        return producto['precio'] * (1 + producto['impuesto'])
    except (KeyError, TypeError):
        return 0