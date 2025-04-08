"""
URL configuration for miwebsite project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
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
from . import views

urlpatterns = [
    path('admin/', admin.site.urls), 
    path('', views.inicio),                          # http://127.0.0.1:8000/
    path('administrador/', views.administrador),     # http://127.0.0.1:8000/administrador/
    path('almacen/', views.almacen),                 # http://127.0.0.1:8000/almacen/
    path('caja/', views.caja),                       # http://127.0.0.1:8000/caja/
    path('empleado/', views.empleado),               # http://127.0.0.1:8000/empleado/
    path('factura/', views.factura),                 # http://127.0.0.1:8000/factura/
    path('limpieza/', views.limpieza),               # http://127.0.0.1:8000/limpieza/
    path('publicidad/', views.publicidad),           # http://127.0.0.1:8000/publicidad/
    path('trabajador/', views.trabajador),           # http://127.0.0.1:8000/trabajador/


  
]
