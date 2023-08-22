from enum import Enum

from fastapi import APIRouter, Request, Depends
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from sqlmodel import Session, select

from ..db import get_session
from ..models import Recipe

class RecipesExploreMode(str, Enum):
    all = "all"
    my = "my"

templates = Jinja2Templates(directory="app/templates")

router = APIRouter(prefix="/recipes",)

@router.get("/", response_class=HTMLResponse)
async def get_recipes(request: Request, session: Session = Depends(get_session), search: str = None, explore_mode: RecipesExploreMode = RecipesExploreMode.all):
    recipes = session.exec(select(Recipe)).all()
    print(explore_mode.name)
    return templates.TemplateResponse("recipes.html", {
            "request": request,
            "recipes": recipes,
            "explore_mode": explore_mode.name
        })

@router.get("/{recipe_id}", response_class=HTMLResponse)
async def recipe(request: Request, recipe_id: int):
    name = "Humus"

    return templates.TemplateResponse("recipe.html", {
            "request": request,
            "name": name
        })
