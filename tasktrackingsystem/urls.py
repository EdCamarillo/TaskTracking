"""
URL configuration for tasktrackingsystem project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
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
from django.urls import include
from django.contrib.auth import views as auth_views

from user import views
from user.views import registrationView, loginView, logoutView
from task.views import addTask
from project.views import createProject

app_name = 'tasktracking'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('register', registrationView.as_view(), name='register'),
    path('login', loginView.as_view(), name='login'),
    path('projects', createProject, name='projects'),
    path('tasks', addTask, name='tasks'),
    path('logout', logoutView, name='logout')
]
