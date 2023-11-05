from .models import User

def userAuthenticate(username, password):
    try:
        user = User.objects.get(Username=username)
        if user.Password == password:
            return User
    except User.DoesNotExist:
        return None