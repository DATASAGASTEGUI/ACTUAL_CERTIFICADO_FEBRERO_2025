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
from .views import index, mostrar_alumnos
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('', index, name='index'),    #http://localhost:8090
    path('admin/', admin.site.urls),  #http://localhost:8090/admin/
    path('mostrar_alumnos/', mostrar_alumnos, name='mostrar_alumnos'), #http://localhost:8090/mostrar_alumnos/
]
