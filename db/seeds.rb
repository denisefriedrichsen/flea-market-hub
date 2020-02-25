# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating a view spots"

Spot.create(title: "Mauerpark", description: "Flea Market at Mauerpark", price: 14)

puts "finished"

User.create (name: "milan", email: "milan@wab.de", password: "123456")
