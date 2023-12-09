from django.db import models
from django.urls import reverse
from user.models import User

class Project(models.Model):
    ProjectID = models.AutoField(primary_key=True)
    ProjectName = models.CharField(max_length=255)
    StartDate = models.DateField()
    Deadline = models.DateField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    def get_absolute_url(self):
        return reverse('tasks', args=[str(self.ProjectID)])

    def __str__(self):
        return self.ProjectName
