Bike.destroy_all
Order.destroy_all
Customer.destroy_all
BikeOrder.destroy_all

# customers
josh = Customer.find_or_create_by(name: 'Joshua Burke', email: 'joshuaburke@email.com')
kevin = Customer.find_or_create_by(name: 'Kevin Heart', email: 'kevinheart@email.com')
# bikes
classic_bike = Bike.find_or_create_by(name: 'Classic Bike', price: 300)
cheap_bike = Bike.find_or_create_by(name: 'Cheap Bike', price: 100)
rocket_bike = Bike.find_or_create_by(name: 'Rocket Bike', price: 1000)
# customizables and options
wheel_size = Customizable.create(name: 'Wheel Size', options: ['15', '17', '19'])

rim_color = Customizable.create(name: 'Rim Color', options: ['Blue', 'Black', 'Spotted'])
# orders
joshs_order = Order.find_or_create_by(customer_id: josh.id, total: 400)
BikeOrder.create(order_id: joshs_order.id, bike_id: cheap_bike.id)
BikeOrder.create(order_id: joshs_order.id, bike_id: cheap_bike.id)
BikeOrder.create(order_id: joshs_order.id, bike_id: cheap_bike.id)
BikeOrder.create(order_id: joshs_order.id, bike_id: cheap_bike.id)
joshs_order.total = 500
# joshs_order = Order.find_or_create_by(customer_id: josh.id, total: 400)
# kevin_order = Order.find_or_create_by(
#   customer_id: kevin.id,
#   total: 500, 
#   bikes: [cheap_bike, cheap_bike, cheap_bike, cheap_bike, cheap_bike]
# )

p "seeded db"
p "joshs_order has #{joshs_order.total} debt"
p "#{wheel_size.name} has #{wheel_size.options} options"
p "#{rim_color.name} has #{rim_color.options} options"