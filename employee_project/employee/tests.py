from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from faker import Faker
from .models import Employee

class EmployeeTests(APITestCase):
    def setUp(self):
        # Initialize Faker instance
        self.fake = Faker()
        # Clear the database
        Employee.objects.all().delete()
        self.list_url = reverse('employee-list-create')
        self.detail_url = lambda pk: reverse('employee-detail', kwargs={'pk': pk})

    def create_employee(self):
        # Generate new random employee data
        employee_data = {
            'first_name': self.fake.first_name(),
            'last_name': self.fake.last_name(),
            'email': self.fake.unique.email(),
            'job_title': self.fake.job(),
            'date_of_birth': self.fake.date_of_birth(minimum_age=18, maximum_age=65).isoformat()
        }
        return Employee.objects.create(**employee_data), employee_data

    def test_get_employee_list(self):
        # Create an employee
        self.create_employee()
        response = self.client.get(self.list_url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)  # Assuming we have one employee

    def test_get_employee_detail(self):
        # Create an employee
        employee, employee_data = self.create_employee()
        response = self.client.get(self.detail_url(employee.id))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['email'], employee_data['email'])

    def test_create_employee(self):
        # Generate new random data for creating an employee
        employee_data = {
            'first_name': self.fake.first_name(),
            'last_name': self.fake.last_name(),
            'email': self.fake.unique.email(),
            'job_title': self.fake.job(),
            'date_of_birth': self.fake.date_of_birth(minimum_age=18, maximum_age=65).isoformat()
        }
        response = self.client.post(self.list_url, employee_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Employee.objects.count(), 1)  # Only one created here
        self.assertEqual(Employee.objects.get(id=response.data['id']).email, employee_data['email'])
