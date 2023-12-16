from django.http import HttpResponse
from django.template import loader
from django.db import connection
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import get_user_model
from django.views import View

from .forms import projectForm
from .models import Project
from task.models import Task

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

def editProject(request, project_id):
    project = get_object_or_404(Project, ProjectID=project_id)
    tasks = Task.objects.filter(Project=project_id)

    if request.method == 'POST':
        form = projectForm(request.POST, instance=project)
        if form.is_valid():
            project_name = form.cleaned_data['ProjectName']
            start_date = form.cleaned_data['StartDate']
            deadline = form.cleaned_data['Deadline']
            project_id = project_id

            cursor = connection.cursor()
            args = [project_name, start_date, deadline, project_id]
            cursor.callproc('editProject', args)
            cursor.close()
            return redirect('tasks', project_id=project_id)
    else:
        form = projectForm(instance=project)

    user_projects = Project.objects.filter(user=request.session.get('user_id'))

    context = {
        'user_projects': user_projects,
        'project': project,
        'tasks': tasks,
        'form': form,
    }

    return render(request,
                  'tasks.html',
                  context)
