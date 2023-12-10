from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render, redirect, get_object_or_404
from django.views import View

from .forms import addTaskForm
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
            task.Status = 'In Progress'
            task.save()

            return redirect('tasks', project_id=project_id)
    else:
        form = addTaskForm()

    user_projects = Project.objects.filter(user=request.session.get('user_id'))
    print(user_projects)

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