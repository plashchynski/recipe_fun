import os

from sqlmodel import create_engine, Session

DATABASE_URL = os.environ.get("DATABASE_URL")
engine = create_engine(DATABASE_URL, echo=True)

# Session with FastAPI Dependency
# https://sqlmodel.tiangolo.com/tutorial/fastapi/session-with-dependency/
def get_session():
    with Session(engine) as session:
        yield session

def get_engine():
    return engine
