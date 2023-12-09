from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render, redirect, get_object_or_404
from django.views import View

from .forms import addTaskForm
from project.models import Project

# Create your views here.

def addTask(request, pk):
    if request.method == 'POST':
        form = addTaskForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('')
    else:
        form = addTaskForm()

    user_projects = Project.objects.filter(user=request.session.get('user_id'))
    print(user_projects)

    project = get_object_or_404(Project, ProjectID=pk)

    context = {
        'user_projects': user_projects,
        'project': project,
        'form': form,
    }

    return render(request,
                  'tasks.html',
                  context
                  )