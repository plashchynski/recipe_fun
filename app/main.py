from fastapi import Depends, FastAPI
from fastapi.staticfiles import StaticFiles

from .routers import recipes

app = FastAPI()

app.mount("/static", StaticFiles(directory="app/static"), name="static")

app.include_router(recipes.router)
