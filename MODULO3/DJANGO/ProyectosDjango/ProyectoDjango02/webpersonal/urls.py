"""
URL configuration for webpersonal project.

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

from webpersonal.views import index, ejemplo01, ejemplo02, ejemplo03, ejemplo04, ejemplo05
urlpatterns = [
    path('', index, name='index'),   # https://127.0.0.1:8090/

    path('ejemplo01/', ejemplo01, name='ejemplo01'),
    path('ejemplo02/', ejemplo02, name='ejemplo02'),
    path('ejemplo03/', ejemplo03, name='ejemplo03'),
    path('ejemplo04/', ejemplo04, name='ejemplo04'),
    path('ejemplo05/', ejemplo05, name='ejemplo05'),

    path('admin/', admin.site.urls),
]
