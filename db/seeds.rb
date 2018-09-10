# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Activity.create([{ activity_name: "Futsal" }, { activity_name: "Cyclisme" }, { activity_name: "Running" }, { activity_name: "Basketball" }, { activity_name: "Football" }])
Location.create([{ street1: "Rue de Montchat", city: "Lyon", zip: "69008" }, { street1: "Rue de Paul", city: "Lyon", zip: "69002" }])

password = 'qwerty'
1.upto(5) do |i|
  User.create(
    username: "Joe#{i}",
    email: "user#{i}@example.com",
    phone: "0102030405",
    password: password,
    password_confirmation: password
  )
end