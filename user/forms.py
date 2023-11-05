from django import forms

from user.models import User

class registrationForm(forms.ModelForm):
    Username = forms.CharField(max_length=255, label_suffix="", label="Username")
    Password = forms.CharField(max_length=255, label_suffix="", label="Password",
                               widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    Email = forms.EmailField(max_length=255, label_suffix="", label="Email",
                               widget=forms.EmailInput(attrs={'class': 'form-control'}))
    Firstname = forms.CharField(max_length=255, label_suffix="", label="First name")
    Lastname = forms.CharField(max_length=255, label_suffix="", label="Last name")
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
    Username = forms.CharField(max_length=255, label_suffix="", label="Username")
    Password = forms.CharField(max_length=255, label_suffix="", label="Password",
                               widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    class Meta:
        model = User
        fields = [
            'Username',
            'Password',
        ]