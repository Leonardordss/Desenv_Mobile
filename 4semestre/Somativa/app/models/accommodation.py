# models/accommodation.py
from django.db import models

class Accommodation(models.Model):
    number = models.CharField(max_length=10, unique=True)
    TYPE_CHOICES = [
        ('standard', 'Standard'),
        ('suite', 'Suíte'),
        ('master', 'Master'),
    ]
    type = models.CharField(max_length=10, choices=TYPE_CHOICES)
    max_guests = models.PositiveIntegerField()
    daily_rate = models.DecimalField(max_digits=8, decimal_places=2)
    STATUS_CHOICES = [
        ('available', 'Disponível'),
        ('occupied', 'Ocupada'),
        ('maintenance', 'Em manutenção'),
    ]
    status = models.CharField(max_length=15, choices=STATUS_CHOICES, default='available')
    last_cleaning_date = models.DateField()
    last_cleaning_employee = models.ForeignKey(
        'Employee',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='last_cleaning'
    )

    def last_cleaning_employee_name(self):
        if self.last_cleaning_employee and hasattr(self.last_cleaning_employee, 'user'):
            return getattr(self.last_cleaning_employee.user, 'name', '-')  # pega name do CustomUser
        return "-"
    last_cleaning_employee_name.short_description = "Funcionário da última limpeza"



    def __str__(self):
        return f"Acomodação {self.number} ({self.get_type_display()})"
