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

cloud_photos = ["https://res.cloudinary.com/jessdsr/image/upload/v1653557438/d8e8dcd18761216a720e3d3d72f23c0506e77354_CHAHEK003TAN_UK_Set_2_Hektor_Tub_Dining_Chair_Tan_and_Black_axpeuj.png",
                "https://res.cloudinary.com/jessdsr/image/upload/v1653557438/db17d114abfaa6aec66ff2a11d0bfd34aa8dcd53_SOFCAE004GRE_UK_CALENDRE_3_seater_Sofa_Olive_Brushed_Cotton_q3epyg.png",
                "https://res.cloudinary.com/jessdsr/image/upload/v1653559754/93e1391abf790de0f4c603a3a8bd907155284ce1_CHAPAX003BRO_UK_Paxton_Reclining_Accent_Armchair_Footstool__ro0c4g.png",
                "https://res.cloudinary.com/jessdsr/image/upload/v1653557437/7b8ed37911fe88247b4b73a5d3d2f962a3ec9c5b_FLPCHI017GRY_UK_Chicago_Floor_Lamp_Black_Copper_ar1_1_PL_PS_vbrx14.png",
                "https://res.cloudinary.com/jessdsr/image/upload/v1653557437/83d4bf190c7021f6790e1880b4eeca25ec301631_CLPADR002GRN_UK_Adrianne_5_Light_Cluster_Pendant_Green_Bras_yjcjdt.png"]

cloud_photos2 = ["https://res.cloudinary.com/jessdsr/image/upload/v1653557437/ab340e91aee4e59dbada17b561d815b6fad027a6_WDISAI206WMR_UK_Amadeo_2_door_150cm_Sliding_Wardrobe_Oak_Fr_uj6wtu.png",
                 "https://res.cloudinary.com/jessdsr/image/upload/v1653557437/6165ab6af28111649ff65f7431e00b38c5206921_TBLTAM001ZOK_UK_Tambo_8_Seat_Dining_Table_Oak_ar1_1_PL_PS_nxpqfz.png",
                 "https://res.cloudinary.com/jessdsr/image/upload/v1653557437/8b942d699fa9817fc2a264781be5bfbe94258aa5_TBLLUC040ZDB_UK_Lucien_8_12_Seat_Extending_Dining_Table_Man_no2fco.png",
                 "https://res.cloudinary.com/jessdsr/image/upload/v1653557437/7a41c5396863cfa0a72e1021f8afad0613295265_BEDMAX089YEL_UK_Maxmo_King_Size_Ottoman_Storage_Bed_Dijon_Y_ksgt52.png",
                 "https://res.cloudinary.com/jessdsr/image/upload/v1653557436/5d51031b5c0839cd5804268f4b3bf24ae367fb54_CLPVER005ZBR_UK_Verona_LED_10_Light_Chandelier_Ceiling_Ligh_l8rgaa.png"]

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

cities = ["Paris", "Metz", "Marseille", "Florence", "Londres", "Washington"]

5.times do |index|
  temp = rand(0..6)
  file = URI.open(cloud_photos[index])
  mylisting = Listing.new(
    name: Faker::Commerce.product_name,
    category: temp,
    user_id: jess.id,
    style: rand(0..8),
    description: Faker::Lorem.sentences(number: 4).join(" "),
    deliverable: (rand <= 0.5),
    price_per_day: rand(100..1000),
    city: cities.sample
  )
  mylisting.photo.attach(io: file, filename: 'main_photo.png', content_type: 'image/png')
  mylisting.save!
end

5.times do |index|
  temp = rand(0..6)
  file = URI.open(cloud_photos2[index])
  mylisting = Listing.new(
    name: Faker::Commerce.product_name,
    category: temp,
    user_id: admin.id,
    style: rand(0..8),
    description: Faker::Lorem.sentences(number: 4).join(" "),
    deliverable: (rand <= 0.5),
    price_per_day: rand(100..1000),
    city: cities.sample
  )
  mylisting.photo.attach(io: file, filename: 'main_photo.png', content_type: 'image/png')
  mylisting.save!
end
