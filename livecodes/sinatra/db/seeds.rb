require 'faker'

puts "Creating restaurants..."
10.times do 
  restaurant = Restaurant.new(name: Faker::JapaneseMedia::OnePiece.island, address: Faker::JapaneseMedia::OnePiece.location )
  restaurant.save
end

puts "Done"