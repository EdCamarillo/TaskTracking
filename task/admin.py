from django.contrib import admin

# Register your models here.
# your_app/admin.py

from django.contrib import admin
from .models import Task

# Register your model with the admin site
admin.site.register(Task)
