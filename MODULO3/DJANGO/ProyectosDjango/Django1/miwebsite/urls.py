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
from miwebsite.views import home, suma, suma_number

urlpatterns = [

    path('', home, name='home'), # http://127.0.0.1:8090
    path('suma/', suma, name='suma'), # http://127.0.0.1:8090/suma/
    path('suma_number/', suma_number, name='suma_number'), # http://127.0.0.1:8090/suma/
    path('admin/', admin.site.urls), # http://127.0.0.1:8090/admin
]
