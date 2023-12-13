from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render, redirect, get_object_or_404
from django.db import connection
from django.views import View

from .forms import addTaskForm
from .forms import editTaskForm
from project.models import Project
from .models import Task

# Create your views here.

def addTask(request, project_id):
    project = get_object_or_404(Project, ProjectID=project_id)
    tasks = Task.objects.filter(Project=project_id)

    if request.method == 'POST':
        form = addTaskForm(request.POST)
        if form.is_valid():
            task = form.save(commit=False)
            task.Project = project
            task.Status = 'To Do'
            task.save()
            return redirect('tasks', project_id=project_id)
    else:
        form = addTaskForm()

    user_projects = Project.objects.filter(user=request.session.get('user_id'))

    context = {
        'user_projects': user_projects,
        'project': project,
        'tasks': tasks,
        'form': form,
    }

    return render(request,
                  'tasks.html',
                  context
                  )

def editTask(request, project_id, task_id):
    project = get_object_or_404(Project, ProjectID=project_id)
    task = get_object_or_404(Task, TaskId=task_id, Project=project_id)
    tasks = Task.objects.filter(Project=project_id)

    if request.method == 'POST':
        form = editTaskForm(request.POST, instance=task)
        if form.is_valid():
            task_name = form.cleaned_data['TaskName']
            description = form.cleaned_data['Description']
            status = form.cleaned_data['Status']
            priority = form.cleaned_data['Priority']
            due_date = form.cleaned_data['DueDate']

            cursor = connection.cursor()
            args = [task_id, task_name, description, status, priority, due_date]
            cursor.callproc('editTask', args)
            cursor.close()
            return redirect('tasks', project_id=project_id)
    else:
        form = editTaskForm(instance=task)

    user_projects = Project.objects.filter(user=request.session.get('user_id'))

    context = {
        'user_projects': user_projects,
        'project': project,
        'tasks': tasks,
        'task': task,
        'form': form,
    }

    return render(request,
                  'tasks.html',
                  context)

def deleteTask(request, project_id, task_id):
    cursor = connection.cursor()
    cursor.callproc('deleteTask', [task_id])
    cursor.close()

    return redirect('tasks', project_id=project_id)
