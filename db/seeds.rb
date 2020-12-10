# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'json'

Critic.destroy_all
Game.destroy_all
User.destroy_all

# Create 10 random users using Faker (you can use Faker::Name, Faker::Internet and Faker::Date)
puts "Start seeding Users"
10.times do
  username = Faker::Name.name
  email = Faker::Internet.email
  birth_date = Faker::Date.between(from: '2002-01-01', to: '2020-12-30')
  first_name = Faker::Name.first_name 
  last_name = Faker::Name.last_name

  user_data = {
    username: username,
    email: email,
    birth_date: birth_date,
    first_name: first_name,
    last_name: last_name,
  }

  User.create(user_data)
end
puts "Finish seeding Users"

puts
# Create all the games from JSON file
puts "Start seeding Games"
  games_data = JSON.parse(File.read('db/games.json'), symbolize_names: true)
  games_data.each do |game_data|
    Game.create(game_data)
  end
puts "Finish seeding Games"
puts

# For each game, create between 1 and 3 critics from random users (you can use Faker::Lorem)
puts "Start seeding Critics"
  games_data = Game.all
  games_data.each do |game_data|
    rand(1..3).times do
      critic_data = {
        title: Faker::Game.title,
        body: Faker::Lorem.sentence(word_count: 8),
        game_id: game_data.id,
        user_id: rand(1..User.all.size)
      }
      pp Critic.create(critic_data)
    end
  end
puts "Finish seeding Critics"