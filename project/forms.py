from django import forms

from project.models import Project

class projectForm(forms.ModelForm):
    ProjectName = forms.CharField(max_length=255, label_suffix="", label=False,
                                  widget=forms.TextInput(attrs={'placeholder': 'Project Name'}))
    StartDate = forms.DateField(label_suffix="", label="Start Date", widget=forms.DateInput(attrs={'type': 'date'}))
    Deadline = forms.DateField(label_suffix="", label="Due Date", widget=forms.DateInput(attrs={'type': 'date'}))

    class Meta:
        model = Project
        fields = [
            'ProjectName',
            'StartDate',
            'Deadline',
        ]