from django.db import models
from django.contrib.auth.models import User

class MenuItem(models.Model):
    CATEGORY_CHOICES = [
        ('LANCHE', 'Lanche'),
        ('PIZZA', 'Pizza'),
        ('OUTRO', 'Outro'),
    ]
    
    name = models.CharField(max_length=100)
    description = models.TextField()
    price = models.DecimalField(max_digits=6, decimal_places=2)
    category = models.CharField(max_length=10, choices=CATEGORY_CHOICES, default='OUTRO')
    is_available = models.BooleanField(default=True)

    def __str__(self):
        return self.name

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    # Adicionar campos adicionais do perfil do usuário, se necessário
    # Ex: phone_number = models.CharField(max_length=15, blank=True, null=True)

    def __str__(self):
        return self.user.username
