from django.db import models
from project.models import Project

class Task(models.Model):
    TaskId = models.AutoField(primary_key=True)
    TaskName = models.CharField(max_length=255)
    Description = models.CharField(max_length=255)
    Status = models.BooleanField()
    Priority = models.CharField(max_length=255)
    DueDate = models.DateField()
    Project = models.ForeignKey(Project, on_delete=models.CASCADE)

    def __str__(self):
        return self.TaskName
