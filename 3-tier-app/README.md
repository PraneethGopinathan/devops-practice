# Voting System - 3-Tier Application

A simple voting system demonstrating a 3-tier web architecture with Docker containerization.

## Architecture

```
┌─────────────────┐
│   Frontend      │  - HTML/CSS/JS (Nginx)
│   Port: 80      │  - User Interface
└────────┬────────┘
         │
         │ HTTP API
         │
┌────────▼────────┐
│   Backend       │  - FastAPI (Python)
│   Port: 8000    │  - REST API
└────┬───────┬────┘
     │       │
┌────▼────┐ ┌▼─────┐
│Database │ │Cache │
│PostgreSQL│ │Redis│
│Port:5432│ │:6379 │
└─────────┘ └──────┘
```

### Components

- **Frontend**: Static web interface served by Nginx
- **Backend**: FastAPI REST API for handling polls and votes
- **Database**: PostgreSQL for persistent data storage
- **Cache**: Redis for real-time vote counting

## Prerequisites

- Docker
- Docker Compose

## How to Run

### 1. Navigate to the project directory
```bash
cd 3-tier-app
```

### 2. Start all services
```bash
docker-compose up --build
```

This will:
- Build the backend and frontend Docker images
- Start PostgreSQL database
- Start Redis cache
- Start the backend API
- Start the frontend web server

### 3. Access the application
- **Frontend**: http://localhost
- **Backend API**: http://localhost:8000
- **API Documentation**: http://localhost:8000/docs

### 4. Stop the application
```bash
# Press Ctrl+C in the terminal, then:
docker-compose down

# To remove all data (volumes):
docker-compose down -v
```

## Useful Docker Commands

```bash
# Start services in detached mode (background)
docker-compose up -d

# View logs
docker-compose logs -f

# View logs for specific service
docker-compose logs -f backend

# List running containers
docker-compose ps

# Restart a specific service
docker-compose restart backend

# Rebuild and start
docker-compose up --build

# Stop services but keep containers
docker-compose stop

# Start stopped services
docker-compose start
```

## Features

- Create polls with multiple options
- Vote on active polls
- Real-time vote counting with Redis caching
- Visual results with percentages and progress bars
- Auto-refresh every 5 seconds

## Project Structure

```
3-tier-app/
├── backend/
│   ├── app/
│   │   ├── main.py         # FastAPI application
│   │   ├── database.py     # DB & Redis connections
│   │   ├── models.py       # Database models
│   │   └── schemas.py      # API schemas
│   ├── Dockerfile
│   └── requirements.txt
├── frontend/
│   ├── index.html
│   ├── styles.css
│   ├── app.js
│   ├── nginx.conf
│   └── Dockerfile
├── docker-compose.yaml      # Orchestrates all services
└── README.md
```

## API Endpoints

- `GET /` - Welcome message
- `POST /polls/` - Create a new poll
- `GET /polls/` - Get all polls
- `GET /polls/{id}` - Get specific poll
- `POST /vote/` - Cast a vote
- `GET /polls/{id}/results` - Get real-time results

## Troubleshooting

**Port already in use?**
```bash
# Change ports in docker-compose.yaml
ports:
  - "8080:80"  # Use 8080 instead of 80
```

**Services not starting?**
```bash
# Check logs
docker-compose logs

# Restart everything
docker-compose down
docker-compose up --build
```

**Reset everything?**
```bash
docker-compose down -v
docker-compose up --build
```

