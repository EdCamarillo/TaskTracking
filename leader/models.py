from django.db import models
from user.models import User


class Leader(models.Model):
    UserID = models.ForeignKey(User, on_delete=models.CASCADE)
    LeaderID = models.IntegerField(primary_key=True)

    def __str__(self):
        return str(self.LeaderID)














