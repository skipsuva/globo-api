# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: "Testman Testy", email: "test@example.com", password: 'password')
user2 = User.create(name: "Sampler McSampleson", email: "sample@example.com", password: 'password')

place1 = Place.create(name: "Flatiron School", lat: 40.7065138, long: -74.0136128)
place2 = Place.create(name: "Empire State Building", lat: 40.7484, long: -73.9857)

pin1 = Pin.create(nickname: "Flatty Schoo", description: "Dope code, brah", user: user1, place: place1)
pin2 = Pin.create(nickname: "Empy Stay Bill", description: "Whoa", user: user2, place: place2)