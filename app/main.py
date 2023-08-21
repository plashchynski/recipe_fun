from fastapi import Depends, FastAPI

from .routers import home, recipes

app = FastAPI()

app.include_router(home.router)
app.include_router(recipes.router)
