from pydantic import BaseModel
from typing import List
from datetime import datetime

class OptionBase(BaseModel):
    text: str

class OptionCreate(OptionBase):
    pass

class Option(OptionBase):
    id: int
    poll_id: int
    votes: int

    class Config:
        from_attributes = True

class PollBase(BaseModel):
    question: str

class PollCreate(PollBase):
    options: List[str]

class Poll(PollBase):
    id: int
    created_at: datetime
    options: List[Option] = []

    class Config:
        from_attributes = True

class VoteRequest(BaseModel):
    option_id: int
