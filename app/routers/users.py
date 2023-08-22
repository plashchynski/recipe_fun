from fastapi import APIRouter, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

templates = Jinja2Templates(directory="app/templates")

router = APIRouter(prefix="/users")

@router.get("/sign_up", response_class=HTMLResponse)
async def home(request: Request):
    return templates.TemplateResponse("sign_up.html", {"request": request})
