from django import forms

from user.models import User

class registrationForm(forms.ModelForm):
    Username = forms.CharField(max_length=255, label_suffix="", label=False,
                               widget=forms.TextInput(attrs={'placeholder': 'Username'}))
    Password = forms.CharField(max_length=255, label_suffix="", label=False,
                               widget=forms.PasswordInput(attrs={'placeholder': 'Password',
                                                                 'class': 'form-control'}))
    Email = forms.EmailField(max_length=255, label_suffix="", label=False,
                               widget=forms.EmailInput(attrs={'placeholder': 'Email',
                                                              'class': 'form-control'}))
    Firstname = forms.CharField(max_length=255, label_suffix="", label=False,
                               widget=forms.TextInput(attrs={'placeholder': 'First name'}))
    Lastname = forms.CharField(max_length=255, label_suffix="", label=False,
                               widget=forms.TextInput(attrs={'placeholder': 'Last name'}))
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
    Username = forms.CharField(max_length=255, label_suffix="", label=False,
                               widget=forms.TextInput(attrs={'placeholder': 'Username'}))
    Password = forms.CharField(max_length=255, label_suffix="", label=False,
                               widget=forms.PasswordInput(attrs={'placeholder': 'Password', 'class': 'form-control'}))
    class Meta:
        model = User
        fields = [
            'Username',
            'Password',
        ]