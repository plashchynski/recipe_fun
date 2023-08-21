# recipe_fun

## Run the app
    
```bash
python -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt
DATABASE_URL="postgresql://postgres@localhost" alembic upgrade head
DATABASE_URL="postgresql://postgres@localhost" uvicorn app.main:app --reload
```

## Generate a new migration

```bash
DATABASE_URL="postgresql://postgres@localhost" alembic revision --autogenerate -m "comment"
DATABASE_URL="postgresql://postgres@localhost" alembic upgrade head
```


## References

- [FastAPI](https://fastapi.tiangolo.com/)
- [Bootstrap](https://getbootstrap.com/)
