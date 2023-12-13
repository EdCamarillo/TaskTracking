from django.http import HttpResponse
from django.template import loader
from django.db import connection
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import get_user_model
from django.views import View

from .forms import projectForm
from .models import Project

# Create your views here.

def createProject(request):
    if request.method == 'POST':
        form = projectForm(request.POST)
        if form.is_valid():
            project_name = form.cleaned_data['ProjectName']
            start_date = form.cleaned_data['StartDate']
            deadline = form.cleaned_data['Deadline']
            user_id = request.session.get('user_id')

            cursor = connection.cursor()
            cursor.callproc('addProject', [project_name, start_date, deadline, user_id])
            cursor.close()

            new_project = Project.objects.filter(ProjectName=project_name, user=user_id).last()
            if new_project:
                return redirect('tasks', project_id=new_project.ProjectID)
    else:
        form = projectForm()

    user_projects = Project.objects.filter(user=request.session.get('user_id'))
    print(user_projects)
    context = {
        'user_projects': user_projects,
        'form': form,
    }

    return render(request,
                  'projects.html',
                  context
                  )

def deleteProject(request, project_id):
    cursor = connection.cursor()
    cursor.callproc('deleteProject', [project_id])
    cursor.close()

    return redirect('projects')
