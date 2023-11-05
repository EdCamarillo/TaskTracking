from django.http import HttpResponse
from django.template import loader
from django.shortcuts import redirect, render
from .utils import userAuthenticate

from .forms import loginForm
from .forms import registrationForm

# Create your views here.
def loginView(request):
    if request.method == 'POST':
        form = loginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['Username']
            password = form.cleaned_data['Password']
            user = userAuthenticate(username, password)
            if user is not None:
                request.session['username'] = username
                return redirect('tasks')
            else:
                return HttpResponse('Invalid login credentials')
    else:
        form = loginForm()

    return render(request,
                  'login.html',
                  {'form': form}
                  )

def registrationView(request):
    if request.method == 'POST':
        form = registrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    else:
        form = registrationForm()

    return render(request,
                  'register.html',
                  {'form': form}
                  )

def logoutView(request):
    request.session.clear()
    return redirect('login')

