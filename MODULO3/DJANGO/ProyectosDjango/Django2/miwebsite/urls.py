"""
URL configuration for miwebsite project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import path

from miwebsite.views import index, insertar_alumnos, mostrar_alumnos, buscar_por_talla, actualizar_alumno, eliminar_alumno, buscar_por_nombre_o_talla, buscar_por_nombre_y_talla, buscar_por_id

urlpatterns = [
    path('', index, name='index'),

    path('alumnos/', mostrar_alumnos, name='mostrar_alumnos'),
    path('alumnos/actualizar/<int:id>/', actualizar_alumno, name='actualizar_alumno'),
    path('alumnos/eliminar/<int:id>/', eliminar_alumno, name='eliminar_alumno'),

    path('buscar_nombre_o_talla/', buscar_por_nombre_o_talla, name='buscar_por_nombre_o_talla'),
    path('buscar_por_nombre_y_talla/', buscar_por_nombre_y_talla, name='buscar_por_nombre_y_talla'),
    
    path('insertar/', insertar_alumnos, name='insertar_alumnos'),
    path('talla/', buscar_por_talla, name='buscar_por_talla'),
    path("admin/", admin.site.urls),

    path('buscar_por_id/', buscar_por_id, name='buscar_por_id'),

]
