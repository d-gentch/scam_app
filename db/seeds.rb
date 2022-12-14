# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.create!(name: "gentch",
             email: "den.9895@list.ru",
             password:              "passpass",
             password_confirmation: "passpass",)

40.times do |n|
  name = Faker::Name.name[0..10]
  email = "example-#{n+100}@railstutorial.org" 
  password = "password"
  User.create!(
        name: name,
        email: email,
        password:              password,
        password_confirmation: password,)
end