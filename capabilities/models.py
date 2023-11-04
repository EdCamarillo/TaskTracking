from django.db import models
from django.contrib.auth.models import User

class Capabilities(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    skills = models.ManyToManyField('Skill', related_name='capabilities', blank=True)
    achievements = models.ManyToManyField('Achievement', related_name='capabilities', blank=True)

    def __str__(self):
        return f'Capabilities for User {self.user.username}'

class Skill(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Achievement(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name
