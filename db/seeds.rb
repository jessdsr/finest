# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

Listing.destroy_all
User.destroy_all

User.create(
  email: "admin@finest.com",
  name: "admin",
  password: "123456"
)

jess = User.create(
  email: "advertiser@finest.com",
  name: "L'armoire de Jess",
  password: "123456"
)

User.create(
  email: "renter@finest.com",
  name: "Les Studios de Julien",
  password: "123456"
)

15.times do
  temp = rand(0..6)
  Listing.create(
    category: temp,
    user_id: jess.id,
    style: rand(0..8),
    description: Faker::Lorem.sentences(number: 2),
    deliverable: (rand <= 0.5),
    price_per_day: rand(100..1000),
    city: Faker::Address.city,
    product_image: "https://source.unsplash.com/random/720%C3%97720/?#{temp}"
  )
end
