from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render, redirect
from django.views import View

from .forms import loginForm
from .forms import registrationForm

# Create your views here.
def login(request):
    if request.method == 'POST':
        form = loginForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('')
    else:
        form = loginForm()

    return render(request,
                  'login.html',
                  {'form': form}
                  )

def registration(request):
    if request.method == 'POST':
        form = registrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    else:
        form = registrationForm()

    # return HttpResponse(template.render())
    return render(request,
                  'register.html',
                  {'form': form}
                  )

