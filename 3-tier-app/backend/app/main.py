from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from typing import List
import json

from . import models, schemas
from .database import engine, get_db, redis_client

# Create database tables
models.Base.metadata.create_all(bind=engine)

app = FastAPI(title="Voting System API")

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
    return {"message": "Welcome to the Voting System API"}

@app.post("/polls/", response_model=schemas.Poll)
def create_poll(poll: schemas.PollCreate, db: Session = Depends(get_db)):
    """Create a new poll with options"""
    db_poll = models.Poll(question=poll.question)
    db.add(db_poll)
    db.commit()
    db.refresh(db_poll)

    # Create options for the poll
    for option_text in poll.options:
        db_option = models.Option(poll_id=db_poll.id, text=option_text, votes=0)
        db.add(db_option)

    db.commit()

    # Cache initial votes in Redis
    for option_text in poll.options:
        redis_client.hset(f"poll:{db_poll.id}", option_text, 0)

    return get_poll(db_poll.id, db)

@app.get("/polls/", response_model=List[schemas.Poll])
def get_polls(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    """Get all polls"""
    polls = db.query(models.Poll).offset(skip).limit(limit).all()
    result = []
    for poll in polls:
        options = db.query(models.Option).filter(models.Option.poll_id == poll.id).all()
        poll_data = schemas.Poll(
            id=poll.id,
            question=poll.question,
            created_at=poll.created_at,
            options=[schemas.Option(
                id=opt.id,
                poll_id=opt.poll_id,
                text=opt.text,
                votes=opt.votes
            ) for opt in options]
        )
        result.append(poll_data)
    return result

@app.get("/polls/{poll_id}", response_model=schemas.Poll)
def get_poll(poll_id: int, db: Session = Depends(get_db)):
    """Get a specific poll with its options"""
    poll = db.query(models.Poll).filter(models.Poll.id == poll_id).first()
    if not poll:
        raise HTTPException(status_code=404, detail="Poll not found")

    options = db.query(models.Option).filter(models.Option.poll_id == poll_id).all()

    return schemas.Poll(
        id=poll.id,
        question=poll.question,
        created_at=poll.created_at,
        options=[schemas.Option(
            id=opt.id,
            poll_id=opt.poll_id,
            text=opt.text,
            votes=opt.votes
        ) for opt in options]
    )

@app.post("/vote/")
def vote(vote_request: schemas.VoteRequest, db: Session = Depends(get_db)):
    """Cast a vote for an option"""
    option = db.query(models.Option).filter(
        models.Option.id == vote_request.option_id
    ).first()

    if not option:
        raise HTTPException(status_code=404, detail="Option not found")

    # Update vote count in database
    option.votes += 1
    db.commit()

    # Update vote count in Redis cache for real-time updates
    redis_key = f"poll:{option.poll_id}"
    redis_client.hincrby(redis_key, option.text, 1)

    return {
        "message": "Vote recorded successfully",
        "option_id": option.id,
        "total_votes": option.votes
    }

@app.get("/polls/{poll_id}/results")
def get_poll_results(poll_id: int, db: Session = Depends(get_db)):
    """Get real-time poll results from Redis cache"""
    poll = db.query(models.Poll).filter(models.Poll.id == poll_id).first()
    if not poll:
        raise HTTPException(status_code=404, detail="Poll not found")

    # Try to get results from Redis first (faster)
    redis_key = f"poll:{poll_id}"
    cached_results = redis_client.hgetall(redis_key)

    if cached_results:
        return {
            "poll_id": poll_id,
            "question": poll.question,
            "results": cached_results
        }

    # Fallback to database if Redis doesn't have the data
    options = db.query(models.Option).filter(models.Option.poll_id == poll_id).all()
    results = {opt.text: opt.votes for opt in options}

    # Update Redis cache
    for opt_text, votes in results.items():
        redis_client.hset(redis_key, opt_text, votes)

    return {
        "poll_id": poll_id,
        "question": poll.question,
        "results": results
    }

@app.get("/health")
def health_check():
    """Health check endpoint"""
    return {"status": "healthy"}
