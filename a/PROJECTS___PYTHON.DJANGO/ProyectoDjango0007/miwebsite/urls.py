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
from miwebsite import views


urlpatterns = [
    path('tabla6/', views.tabla_multiplicar_6, name='tabla_6'),
    path('convertir/', views.convertir_binario, name='convertir_binario'),
    path('', views.resolver_ecuacion, name='resolver_ecuacion'),
    path('sumar/', views.sumar, name='sumar'),
    path('admin/', admin.site.urls),
]
