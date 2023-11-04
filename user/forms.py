from django import forms

from user.models import User

class registrationForm(forms.ModelForm):
    class Meta:
        model = User
        fields = [
            'Username',
            'Password',
            'Email',
            'Firstname',
            'Lastname'
        ]

class loginForm(forms.ModelForm):
    class Meta:
        model = User
        fields = [
            'Username',
            'Password',
        ]