from django.db import models
from leader.models import Leader

class Member_Role(models.Model):
    RoleName = models.CharField(max_length=100, primary_key=True)
    LeaderID = models.ForeignKey(Leader, on_delete=models.CASCADE)
    AssignDate = models.DateField()

    def __str__(self):
        return self.RoleName
