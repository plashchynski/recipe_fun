# recipe_fun

## Run the app
    
```bash
python -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt
```

Install [PostgreSQL](https://www.postgresql.org/). It's recommended to use [Postgres.app](https://postgresapp.com/) for macOS.

Connect to the database:
```bash
psql
```

Create a new database:
```sql
create database recipe_fun;
```

Create database schema and populate it with test data:
```bash
DATABASE_URL="postgresql://postgres@localhost/recipe_fun" alembic upgrade head
DATABASE_URL="postgresql://postgres@localhost/recipe_fun" python seed.py
```

Run the web server:
```bash
DATABASE_URL="postgresql://postgres@localhost/recipe_fun" uvicorn app.main:app --reload
```

## Generate a new migration

```bash
DATABASE_URL="postgresql://postgres@localhost/recipe_fun" alembic revision --autogenerate -m "comment"
DATABASE_URL="postgresql://postgres@localhost/recipe_fun" alembic upgrade head
```


## References

- [FastAPI](https://fastapi.tiangolo.com/)
- [Bootstrap](https://getbootstrap.com/)
