from django.http import HttpResponse
from django.template import loader
from django.shortcuts import redirect, render
from django.db import connection
from .utils import userAuthenticate

from django.shortcuts import render
from django.views import View
from django.db import connection
from django.http import HttpResponseRedirect

from .forms import loginForm
from .forms import registrationForm

# Create your views here.
class loginView(View):
    template = "login.html"
    def get(self, request):
        form = loginForm()
        return render(request, self.template, {'form': form})

    def post(self, request):
        form = loginForm(request.POST)

        if form.is_valid():
            uname = request.POST['Username']
            pwd = request.POST['Password']
            cursor = connection.cursor()

            args = [uname, pwd]
            cursor.callproc('checkCredentials', args)
            result = cursor.fetchall()
            cursor.close()
            print(args)
            if result[0][0] == 0:
                msg = 'Invalid login credentials'
                return render(request, self.template,{'form': form, 'msg': msg})
            else:
                user_id = result[0][1]
                print(result)
                request.session['username'] = uname
                request.session['user_id'] = user_id
                return redirect('projects')

        return render(request, self.template, {'form': form})

class registrationView(View):
    template = "register.html"

    def get(self, request):
        form = registrationForm()
        return render(request, self.template, {'form': form})

    def post(self, request):
        uname = request.POST['Username']
        pwd = request.POST['Password']
        email = request.POST['Email']
        fname = request.POST['Firstname']
        lname = request.POST['Lastname']
        result = ""
        cursor = connection.cursor()
        args = [uname, pwd, fname, email, lname, result]
        cursor.callproc('insertUser', args)
        cursor.close()
        return redirect('login')

def logoutView(request):
    request.session.clear()
    return redirect('login')

