# This is where you can create initial data for your app.
require 'faker'

Restaurant.destroy_all

100.times do 
  Restaurant.create(name: Faker::Books::Dune.character, city: Faker::Books::Dune.city)
end