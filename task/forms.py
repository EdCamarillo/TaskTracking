from django import forms

from .models import Task

Priority_Choices = [
    ('High', 'High'),
    ('Medium', 'Medium'),
    ('Low', 'Low'),
]
class addTaskForm(forms.ModelForm):
    TaskName = forms.CharField(max_length=255, label_suffix="", label="Name")
    Description = forms.CharField(max_length=255, label_suffix="", label="Description", widget=forms.Textarea(attrs={'rows': 3, 'cols': 20}))
    Priority = forms.ChoiceField(label_suffix="", label="Priority", choices=Priority_Choices)
    DueDate = forms.DateField(label_suffix="", label="Due Date", widget=forms.DateInput(attrs={'type': 'date'}))
    class Meta:
        model = Task
        fields = [
            'TaskName',
            'Description',
            'Priority',
            'DueDate'
        ]
