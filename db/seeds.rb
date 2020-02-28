require 'faker'
    #address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    #rating:  rand(0..5)
    #password = "password"
    #user.encrypted_password = User.new(:password => password).encrypted_password

puts "Destroying all Spots and Bookings"


Spot.destroy_all
Booking.destroy_all
User.destroy_all

puts "Creating 5 fake users..."

5.times do
  user = User.new(
    name:    Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456789',
    password_confirmation: '123456789'
  )
  user.save!
end

puts "Successfully created 10 fake users :)"

puts "Creating 3 fake spots for every user"

users = User.all
users.each do |u|
  3.times do
    spot = Spot.new(
      title: Faker::Company.name, #replace by market names scraped form a website!
      description: Faker::Lorem.sentence(word_count: 10), # replace by descriptions scraped from a website!
      # address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      address: [ 'Kreuzberg', 'Friedrichshain', 'Potsdam', 'Pankow', 'Prenzlauer Berg'].sample,
      price: rand(10..30)
    )
    spot.user = u
    spot.save!
  end
end

puts "Successfully created lots of fake spots :)"

puts "Creating a view Bookings"
users = User.all
l = users.length
spots = Spot.all

spots.each do |s|
  booking = Booking.new(
    date: Faker::Date.forward(days: 100)
  )
  booking.spot = s
  id = s.user.id
  id += 1
  if User.exists?(id)
    user = User.find(id)
    booking.user = user
  else
    user = User.first
    booking.user = user
  end
  booking.save!
end
puts "finished"






# #3
# puts 'Cleaning database...'
# Restaurant.destroy_all

# puts 'Creating restaurants...'
# restaurants_attributes = [
#   {
#     name:         'Dishoom',
#     address:      '7 Boundary St, London E2 7JE',
#     description:  'Buzzy destination for Indian street food in Bombay-style vintage decor.',
#     stars:        5
#   },
#   {
#     name:         'Pizza East',
#     address:      '56A Shoreditch High St, London E1 6PQ',
#     description:  'Pizzeria with industrial looks, serving rustic pizza and antipasti.',
#     stars:        4
#   }
# ]
# Restaurant.create!(restaurants_attributes)
# puts 'Finished!'


# #4
# require "open-uri"

# file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# Here we write article.photo.attach(...) because we wrote has_one_attached :photo in app/models/article.rb

# #5
# require "open-uri"
# require "yaml"

# file = "https://gist.githubusercontent.com/ssaunier/25920c896baa0e4495fd/raw/9c26ce104c15fc237126bf6b136b8e318368f8ad/imdb.yml"
# sample = YAML.load(open(file).read)

# puts 'Creating directors...'
# directors = {}  # slug => Director
# sample["directors"].each do |director|
#   directors[director["slug"]] = Director.create! director.slice("first_name", "last_name")
# end

# puts 'Creating movies...'
# sample["movies"].each do |movie|
#   Movie.create! movie.slice("title", "year", "syllabus").merge(director: directors[movie["director_slug"]])
# end

# puts 'Creating tv shows...'
# sample["series"].each do |tv_show|
#   TvShow.create! tv_show
# end
# puts 'Finished!'


# #6
# puts 'Cleaning database...'
# Teddy.destroy_all
# Category.destroy_all

# puts 'Creating categories...'
# geek = Category.create!(name: 'geek')
# kids = Category.create!(name: 'kids')

# puts 'Creating teddies...'
# Teddy.create!(sku: 'original-teddy-bear', name: 'Teddy bear', category: kids, photo_url: 'http://onehdwallpaper.com/wp-content/uploads/2015/07/Teddy-Bears-HD-Images.jpg')

# Teddy.create!(sku: 'jean-mimi', name: 'Jean-Michel - Le Wagon', category: geek, photo_url: 'https://pbs.twimg.com/media/B_AUcKeU4AE6ZcG.jpg:large')
# Teddy.create!(sku: 'octocat',   name: 'Octocat -  GitHub',      category: geek, photo_url: 'https://cdn-ak.f.st-hatena.com/images/fotolife/s/suzumidokoro/20160413/20160413220730.jpg')
# puts 'Finished!'

# #7
# puts 'Creating restaurants...'
# Restaurant.create!({
#   name: "Le Dindon en Laisse",
#   address: "18 Rue Beautreillis, 75004 Paris, France"
# })
# Restaurant.create!({
#   name: "Neuf et Voisins",
#   address: "Van Arteveldestraat 1, 1000 Brussels, Belgium"
# })
# puts 'Finished!'


# #7
# puts 'Creating 5 products...'
# 5.times do |i|
#   product = Product.create!(
#     name: Faker::Company.name,
#     tagline: Faker::Company.catch_phrase
#   )
#   puts "#{i + 1}. #{product.name}"
# end
# puts 'Finished!'

# #8
# git push heroku master
# heroku run rails db:migrate db:seed
# heroku open
