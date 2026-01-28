# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a DevOps practice repository containing an Employee Management System with full-stack implementation and AWS infrastructure deployment using Terraform.

### Architecture

**Three-tier application:**
- **Frontend**: React + Vite application (`employee_project/employee-list/`)
- **Backend**: Django REST API with PostgreSQL (`employee_project/`)
- **Infrastructure**: AWS ECS Fargate, VPC, RDS, S3 + CloudFront (Terraform modules in `employee_project/deployment/terraform/`)

**Key integration points:**
- Backend API endpoints at `/employees/` (list, detail, create)
- CORS enabled on backend for frontend communication
- Database configuration via `.env` file using `dj_database_url`
- Docker Compose orchestrates local development (db, web, frontend services)

## Development Commands

### Backend (Django)

```bash
cd employee_project

# Setup virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt

# Database operations
python manage.py makemigrations
python manage.py migrate

# Run development server
python manage.py runserver

# Run tests
python manage.py test
```

### Frontend (React + Vite)

```bash
cd employee_project/employee-list

# Install dependencies
npm install

# Development server (port 5173)
npm run dev

# Build for production
npm run build

# Lint code
npm run lint

# Preview production build
npm run preview
```

### Docker

```bash
cd employee_project

# Start all services (db, web, frontend)
docker-compose up

# Rebuild and start
docker-compose up --build

# Stop services
docker-compose down
```

The Docker setup creates three services:
- `db`: PostgreSQL database
- `web`: Django backend (port 8000)
- `frontend`: React app served via nginx (port 5173)

### Terraform (AWS Infrastructure)

```bash
cd employee_project/deployment/terraform

# Initialize Terraform
terraform init

# Plan infrastructure changes
terraform plan

# Apply infrastructure
terraform apply

# Destroy infrastructure
terraform destroy
```

**AWS Profile**: The Terraform configuration uses AWS profile `praneeth-test` (configured in `provider.tf`). Ensure this profile exists in `~/.aws/credentials`.

## Infrastructure Architecture

**Terraform Module Structure:**
- `main.tf`: Root module orchestrating all infrastructure
- `vpc/`: VPC, subnets (public/private), internet gateway, route tables
- `ecs-lb/`: ECS Fargate cluster, task definitions, ALB with target groups
- `s3/`: S3 bucket with CloudFront distribution for static hosting
- `rds/`: RDS PostgreSQL database (currently commented out)

**Current Active Infrastructure:**
- VPC module (creates networking foundation)
- ECS + Load Balancer module (deploys containerized application)
- S3 + CloudFront module (commented out in main.tf)
- RDS module (commented out in main.tf)

**Backend State**: S3 backend configuration exists in `provider.tf` but is commented out. Currently using local state.

## Configuration Requirements

### Backend (.env file)

Create `employee_project/.env`:
```
SECRET_KEY=your_secret_key
DEBUG=True
DATABASE_URL=postgres://USER:PASSWORD@HOST:PORT/NAME
POSTGRES_USER=user
POSTGRES_PASSWORD=password
POSTGRES_SERVER=db
POSTGRES_DB=employee_db
```

### Frontend API Configuration

The frontend makes API calls to the backend. Check `employee_project/employee-list/src/api.js` for API endpoint configuration.

## Important Notes

- **CORS**: Backend has `CORS_ALLOW_ALL_ORIGINS = True` in settings - restrict this for production
- **Database**: Uses `dj_database_url` for flexible database configuration via environment variables
- **Allowed Hosts**: Currently set for local development (localhost, 127.0.0.1, 0.0.0.0)
- **ECS Container**: Task definition references `var.container_image` - update with your ECR image URI
- **CloudFront**: S3 module includes CloudFront with aliases that need updating for actual domains
