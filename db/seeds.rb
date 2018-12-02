# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
josh = Customer.find_or_create_by(name: 'Joshua Burke', email: 'joshuaburke@email.com')
kevin = Customer.find_or_create_by(name: 'Kevin Heart', email: 'kevinheart@email.com')
classic_bike = Bike.find_or_create_by(name: 'Classic Bike', price: 300)
cheap_bike = Bike.find_or_create_by(name: 'Cheap Bike', price: 100)
joshs_order = order.find_or_create_by(customer_id: josh.id, total: 400, bikes: [cheap_bike, classic_bike])
kevin_order = order.find_or_create_by(
  customer_id: kevin.id,
  total: 500, 
  bikes: [cheap_bike, cheap_bike, cheap_bike, cheap_bike, cheap_bike]
)