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

from miwebsite.views import bienvenida, home, muchas_bienvenidas, sumar

urlpatterns = [
    path('muchas-bienvenidas/', muchas_bienvenidas, name='muchas_bienvenidas'), # http://localhost:8094/muchas-bienvenidas/
    path('bienvenida/', bienvenida, name='bienvenida'),                         # http://localhost:8094/bienvenida/
    path('', home, name='home'),                                                # http://localhost:8094/
    path('admin/', admin.site.urls),                     # http://localhost:8094/admin/

    path('sumar/', sumar, name='sumar')                # http://localhost:8094/sumar/add/
]
