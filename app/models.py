from typing import Optional

from sqlmodel import SQLModel, Field

class Recipe(SQLModel, table=True):
    id: Optional[int] = Field(default= None, nullable=False, primary_key=True)
    name: str
