from sqlmodel import Session

from app.db import get_engine
from app.models import Recipe

engine = get_engine()

humus = Recipe(
    name="Humus",
    description="Hummus, also spelled hommus or houmous, is a dip of Arab origin, spread, or savory dish made from cooked, mashed chickpeas blended with tahini, lemon juice, and garlic. The standard garnish in the Middle East includes olive oil, a few whole chickpeas, parsley, and paprika.",
    directions=[
            "In the bowl combine tahini and lemon juce and  process for 1 minute",
            "Add the olive oil, minced garlic, salt.",
            "Process for another 30 seconds",
            "Open, drain, and rinse the chickpeas."
        ]
    )

with Session(engine) as session:
    session.add(humus)
    session.commit()
