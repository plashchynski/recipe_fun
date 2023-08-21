from enum import Enum

from fastapi import APIRouter, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

class RecipesExploreMode(str, Enum):
    all = "all"
    my = "my"

templates = Jinja2Templates(directory="app/templates")

router = APIRouter(prefix="/recipes",)

@router.get("/", response_class=HTMLResponse)
async def recipes(request: Request, search: str = None, explore_mode: RecipesExploreMode = RecipesExploreMode.all):
    return templates.TemplateResponse("recipes.html", {"request": request})

@router.get("/{recipe_id}", response_class=HTMLResponse)
async def recipe(request: Request, recipe_id: int):
    name = "Humus"

    return templates.TemplateResponse("recipe.html", {
            "request": request,
            "name": name
        })
