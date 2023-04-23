# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
begin
  User.create!(
    name: 'aaa',
    email: 'aaa@mail.com',
    password: '123456'
  )
rescue Exception => e
  puts "Error creating user: #{e.message}"
end

begin
  Admin.create!(
    email: 'admin@mail.com',
    password: '123456'
  )
rescue Exception => e
  puts "Error creating admin: #{e.message}"
end
