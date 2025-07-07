from django.db import models

from django.urls import path
from . import views  # 👈 esto importa 'views.py' de la misma app

urlpatterns = [
    path('saludo/', views.saludo),  # 👈 asegúrate que 'saludo' esté en views.py
]