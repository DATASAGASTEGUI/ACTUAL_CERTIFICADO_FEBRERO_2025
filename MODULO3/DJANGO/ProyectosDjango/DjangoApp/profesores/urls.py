from django.urls import path
from . import views

urlpatterns = [
    path('', views.lista_profesores, name='lista_profesores'),
]