# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(name: "Pouch", description: "A pouch for your water", price_in_cents: 500)

Product.create(name: "Boots", description: "Made for walking", price_in_cents: 10000)

Product.create(name: "Benwah Balls", description: "Kegel exercisers", price_in_cents: 1000)
