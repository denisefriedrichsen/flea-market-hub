# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Spot.destroy_all
User.destroy_all

puts "Creating a view spots"

# new_user = User.create!(name: "Caro", email: "caro@web.de", password: "123456")

# Spot.create!(title: "Mauerpark", description: "Flea Market at Mauerpark", price: 14, user: new_user)
# Spot.create!(title: "Mauerpark", description: "Flea Market at Mauerpark", price: 14, user: new_user)
# Spot.create!(title: "Mauerpark", description: "Flea Market at Mauerpark", price: 14, user: new_user)
# Spot.create!(title: "Mauerpark", description: "Flea Market at Mauerpark", price: 14, user: new_user)

puts "finished"
