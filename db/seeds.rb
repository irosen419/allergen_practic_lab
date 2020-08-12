# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

User.create(name: "Ian", allergies: "berries, dairy")
User.create(name: "James", allergies: "apples, eggs")
User.create(name: "Brian", allergies: "eggs, peanuts")
User.create(name: "Ryan", allergies: "eggs, oil, meat")
User.create(name: "Jenn", allergies: "peanuts, nachos")
User.create(name: "Se Min", allergies: "cheese")
