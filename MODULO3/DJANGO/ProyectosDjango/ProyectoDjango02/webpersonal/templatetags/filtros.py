from django import template

register = template.Library()

@register.filter
def total_con_impuesto(producto):
    try:
        precio = producto.get('precio', 0)
        impuesto = producto.get('impuesto', 0)
        return round(precio * (1 + impuesto), 2)
    except (AttributeError, TypeError):
        return 0.00