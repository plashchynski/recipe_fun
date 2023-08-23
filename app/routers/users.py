from typing_extensions import Annotated

from fastapi import APIRouter, Request, Form, Depends
from fastapi.responses import HTMLResponse, RedirectResponse
from fastapi.templating import Jinja2Templates

from sqlmodel import Session, select

from passlib.context import CryptContext

from ..models import User
from ..db import get_session

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
def get_password_hash(password):
    """
    Return hashed password
    """
    return pwd_context.hash(password)

templates = Jinja2Templates(directory="app/templates")

router = APIRouter(prefix="/users")

@router.get("/sign_up", response_class=HTMLResponse)
async def show_sign_up(request: Request):
    return templates.TemplateResponse("sign_up.html", {"request": request, "email": "", "password": "", "name": ""})

@router.post("/sign_up", response_class=HTMLResponse)
async def sign_up(request: Request, email: Annotated[str, Form()], name: Annotated[str, Form()], password: Annotated[str, Form()], session: Session = Depends(get_session)):
    error = None

    # check if a user with the same email exists
    statement = select(User).where(User.email == email)
    recipe = session.exec(statement).first()
    if recipe:
        error = "A user already exists with that email address."
        return templates.TemplateResponse("sign_up.html", {"request": request, "email": "", "password": "", "name": name, "error": error})

    new_user = User(
        email=email,
        name=name,
        hashed_password=get_password_hash(password)
    )
    session.add(new_user)
    session.commit()
    session.refresh(new_user)

    return RedirectResponse("/", status_code=302)
