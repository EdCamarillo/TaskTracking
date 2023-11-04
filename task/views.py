from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render, redirect
from django.views import View

from .forms import addTaskForm

# Create your views here.

def addTask(request):
    if request.method == 'POST':
        form = addTaskForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('')
    else:
        form = addTaskForm()

    return render(request,
                  'tasks.html',
                  {'form': form}
                  )
