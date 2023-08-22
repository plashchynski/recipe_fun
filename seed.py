from sqlmodel import Session

from app.db import get_engine
from app.models import Recipe

engine = get_engine()

with Session(engine) as session:
    session.exec("TRUNCATE recipe")
    session.exec("ALTER SEQUENCE recipe_id_seq RESTART WITH 1")
    session.commit()

recipe_1 = Recipe(
        name="Humus",
        description="Hummus, also spelled hommus or houmous, is a dip of Arab origin, spread, or savory dish made from cooked, mashed chickpeas blended with tahini, lemon juice, and garlic. The standard garnish in the Middle East includes olive oil, a few whole chickpeas, parsley, and paprika.",
        directions=[
            "In the bowl combine tahini and lemon juce and  process for 1 minute",
            "Add the olive oil, minced garlic, salt.",
            "Process for another 30 seconds",
            "Open, drain, and rinse the chickpeas."
        ]
    )

recipe_2 = Recipe(
        name="Chicken Kiev",
        description="Made from a boned and skinned breast which is cut lengthwise, pounded and stuffed with butter.",
        directions=[]
    )

recipe_3 = Recipe(
        name="Tagliatelle with ragù",
        description="type of pasta from the Emilia-Romagna and Marche regions of Italy",
        directions=[]
    )

recipe_4 = Recipe(
        name="Minestrone",
        description="Thick soup of Italian origin made with vegetables",
        directions=[]
    )

recipe_4 = Recipe(
        name="Greek salad",
        description="A popular salad in Greek cuisine generally made of tomatoes",
        directions=[]
    )

with Session(engine) as session:
    session.add(recipe_1)
    session.add(recipe_2)
    session.add(recipe_3)
    session.add(recipe_4)
    session.commit()
