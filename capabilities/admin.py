from django.contrib import admin
from .models import Capabilities, Skill, Achievement

class CapabilitiesAdmin(admin.ModelAdmin):
    filter_horizontal = ('skills', 'achievements')

admin.site.register(Capabilities, CapabilitiesAdmin)
admin.site.register(Skill)
admin.site.register(Achievement)
