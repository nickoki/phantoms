# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative './user_data.rb'
require_relative './phantom_data.rb'
require_relative './song_data.rb'

User.destroy_all
Phantom.destroy_all
Song.destroy_all
Solo.destroy_all

user_data = get_user_data()
phantom_data = get_phantom_data()
song_data = get_song_data()

user_data.each_pair do |user_name, user_info|

  new_user = User.create! user_info

  new_phantom = phantom_data[user_name]
  binding.pry
  Phantom.create!(new_phantom.merge(user: new_user))
end

song_data.each do |song|
  Song.create! song
end
