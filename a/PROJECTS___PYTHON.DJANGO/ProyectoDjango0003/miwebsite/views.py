from django.http import HttpResponse
from django.shortcuts import render

# Recibir una solicitud(request) como parámetro y retornar una respuesta(response) como resultado
# HttpRequest y HttpResponse son clases de Django
# HttpRequest request y HttpResponse response
# Definimos una vista simple llamada home
def home(request):
    return HttpResponse('Hola Mundo!')