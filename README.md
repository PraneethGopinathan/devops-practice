# DevOps Practice Repository

A collection of projects and practice exercises for learning and demonstrating DevOps concepts, tools, and best practices.

## Overview

This repository contains hands-on projects covering various DevOps topics including containerization, orchestration, CI/CD, infrastructure as code, and cloud deployments.

## Projects

### 1. 3-Tier Voting Application (`3-tier-app/`)

A simple voting system demonstrating modern 3-tier web architecture with full Docker containerization.

**Tech Stack:**
- Frontend: HTML/CSS/JavaScript (Nginx)
- Backend: FastAPI (Python)
- Database: PostgreSQL
- Cache: Redis

**DevOps Concepts:**
- Docker containerization
- Multi-container orchestration with Docker Compose
- Microservices architecture
- Container networking
- Volume management
- Health checks

[View Project →](./3-tier-app/)

### 2. Employee Management System (`employee_project/`)

A full-stack employee management application with AWS infrastructure deployment.

**Tech Stack:**
- Frontend: React + Vite
- Backend: Django REST Framework
- Database: PostgreSQL
- Infrastructure: AWS (ECS Fargate, VPC, RDS, S3, CloudFront)

**DevOps Concepts:**
- Infrastructure as Code (Terraform)
- AWS cloud services
- Container orchestration with ECS
- Load balancing
- VPC networking
- Static site hosting with S3 + CloudFront
- Docker Compose for local development

[View Project →](./employee_project/)

## Skills Covered

- **Containerization**: Docker, Dockerfiles, multi-stage builds
- **Orchestration**: Docker Compose, AWS ECS
- **Infrastructure as Code**: Terraform modules
- **Cloud Platforms**: AWS (VPC, ECS, RDS, S3, CloudFront, ALB)
- **Networking**: Container networking, VPC design, load balancing
- **Databases**: PostgreSQL, Redis
- **Web Frameworks**: FastAPI, Django, React
- **CI/CD**: Ready for pipeline integration

## Getting Started

Each project has its own README with detailed setup instructions. Navigate to the project directory:

```bash
# 3-Tier Voting App
cd 3-tier-app
docker-compose up --build

# Employee Management System
cd employee_project
docker-compose up --build
```

## Prerequisites

- Docker & Docker Compose
- Terraform (for infrastructure deployment)
- AWS CLI (for cloud deployments)
- Python 3.11+
- Node.js & npm (for frontend development)

## Repository Structure

```
devops-practice/
├── 3-tier-app/              # Voting system with Docker
├── employee_project/        # Employee management with Terraform
├── CLAUDE.md               # AI assistant guidance
└── README.md               # This file
```

## Future Projects

Planned additions:
- Kubernetes deployment examples
- CI/CD pipeline configurations (GitHub Actions, Jenkins)
- Monitoring and logging setup (Prometheus, Grafana, ELK)
- Service mesh implementation
- GitOps workflows
- Helm charts

## Contributing

This is a personal learning repository. Feel free to fork and use for your own learning!

## License

MIT License - Free to use for educational purposes.
