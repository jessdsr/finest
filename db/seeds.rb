# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

Listing.destroy_all
User.destroy_all

admin = User.create!(
  email: "admin@finest.com",
  name: "admin",
  password: "123456",
  admin: true
)

jess = User.create!(
  email: "advertiser@finest.com",
  name: "L'armoire de Jess",
  password: "123456"
)

User.create!(
  email: "renter@finest.com",
  name: "Les Studios de Julien",
  password: "123456"
)

15.times do
  temp = rand(0..6)
  file = URI.open('https://res.cloudinary.com/guilhem/image/upload/v1653397075/RDnD/Duck-You-rubber-duck-front-Amsterdam-Duck-Store-400x400_rnqxsc.jpg')
  mylisting = Listing.new(
    name: Faker::Commerce.product_name,
    category: temp,
    user_id: jess.id,
    style: rand(0..8),
    description: Faker::Lorem.sentences(number: 4).join(" "),
    deliverable: (rand <= 0.5),
    price_per_day: rand(100..1000),
    city: Faker::Address.city
  )
  mylisting.photo.attach(io: file, filename: 'main_photo.png', content_type: 'image/png')
  mylisting.save!
end

4.times do
  temp = rand(0..6)
  file = URI.open('https://res.cloudinary.com/guilhem/image/upload/v1653397075/RDnD/Duck-You-rubber-duck-front-Amsterdam-Duck-Store-400x400_rnqxsc.jpg')
  mylisting = Listing.new(
    name: Faker::Commerce.product_name,
    category: temp,
    user_id: admin.id,
    style: rand(0..8),
    description: Faker::Lorem.sentences(number: 4).join(" "),
    deliverable: (rand <= 0.5),
    price_per_day: rand(100..1000),
    city: Faker::Address.city
  )
  mylisting.photo.attach(io: file, filename: 'main_photo.png', content_type: 'image/png')
  mylisting.save!
end
