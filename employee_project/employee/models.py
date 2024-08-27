from django.db import models

# Create your models here.
class Employee(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    job_title = models.CharField(max_length=100)
    date_of_birth = models.DateField()

    def __str__(self):
        return f'{self.first_name} {self.last_name}'