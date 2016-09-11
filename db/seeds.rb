# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
200.times do
  Address.create(
    :addresses_1 => Faker::Address.street_address,
    :addresses_2 => Faker::Address.secondary_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state,
    :zip => Faker::Address.zip_code,
    :employee_id => rand(1..100)
  )
end

users = User.all
user  = users.first
following = users[7..100]
followers = users[8..150]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
