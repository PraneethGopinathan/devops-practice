FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY employee /app/employee/
COPY employee_project /app/employee_project
COPY manage.py /app/manage.py

EXPOSE 8000
ENV PYTHONUNBUFFERED 1
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]