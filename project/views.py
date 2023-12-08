from django.http import HttpResponse
from django.template import loader
from django.db import connection
from django.shortcuts import render, redirect
from django.contrib.auth import get_user_model
from django.views import View

from .forms import projectForm

# Create your views here.

def createProject(request):
    if request.method == 'POST':
        form = projectForm(request.POST)
        if form.is_valid():
            project_name = form.cleaned_data['ProjectName']
            start_date = form.cleaned_data['StartDate']
            deadline = form.cleaned_data['Deadline']
            user_id = request.session.get('id')

            with connection.cursor() as cursor:
                cursor.callproc('addProject', [project_name, start_date, deadline, user_id])

            return redirect('tasks')  # Redirect to project list page after successful submission
    else:
        form = projectForm()

    return render(request,
                  'projects.html',
                  {'form': form}
                  )
