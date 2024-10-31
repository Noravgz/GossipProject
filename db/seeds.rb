# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

cities = []
10.times do
  cities << City.create(name: Faker::Address.city)
end

10.times do
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      city: cities.sample,
      email: Faker::Internet.email,
      age: rand(18..80),
      description: Faker::Lorem.paragraph(sentence_count: 2) 
    )
  
    # Pour chaque utilisateur, créer entre 1 et 5 potins
    rand(1..5).times do
      Gossip.create(
        title: Faker::Book.title,
        content: Faker::Lorem.paragraph(sentence_count: 5),
        user: user
      )
    end
  end
  
User.create(
    first_name: "Anonymous"
  )
  puts "10 utilisateurs avec leurs potins ont été créés !"