# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!({
    first_name: "John",
    last_name: "Doe",
    email: "admin@example.com",
    password: "qwer1234"
})

recipes = [
    {
        name: "Humus",
        description: "Hummus, also spelled hommus or houmous, is a dip of Arab origin, spread, or savory dish made from cooked, mashed chickpeas blended with tahini, lemon juice, and garlic. The standard garnish in the Middle East includes olive oil, a few whole chickpeas, parsley, and paprika.",
        user: user
    },
    {
        name: "Chicken Kiev",
        description: "Made from a boned and skinned breast which is cut lengthwise, pounded and stuffed with butter.",
        user: user
    },
    {
        name: "Tagliatelle with ragù",
        description: "type of pasta from the Emilia-Romagna and Marche regions of Italy",
        user: user
    },
    {
        name: "Minestrone",
        description: "Thick soup of Italian origin made with vegetables",
        user: user
    },
    {
        name: "Greek salad",
        description: "A popular salad in Greek cuisine generally made of tomatoes",
        user: user
    }
]

Recipe.create!(recipes)
