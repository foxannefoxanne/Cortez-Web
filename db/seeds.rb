# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Gehrig Keane",
             email: "gehrigkeane@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

User.create!(name:  "Qiaozhi Wang",
             email: "qzwang@ku.edu",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
             
Map.create!(title: "Sample",
            description: "Sample map")
            
Pin.create!(title: "KU",
            description: "KU Pin",
            address: "1450 Jayhawk Blvd, Lawrence, KS 66045",
            latitude: "38.9581",
            longitude: "95.2478",
            map_id: 1)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
