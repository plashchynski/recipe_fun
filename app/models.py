from typing import Optional, List

from sqlmodel import SQLModel, Field

class Recipe(SQLModel, table=True):
    id: Optional[int] = Field(default= None, nullable=False, primary_key=True)
    name: str
    description: str
    directions: List[str]

class User(SQLModel, table=True):
    id: Optional[int] = Field(default=None, nullable=False, primary_key=True)
    name: str = Field(nullable=False)
    email: str = Field(unique=True, index=True, nullable=False)
    hashed_password: str
