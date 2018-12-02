Bike.destroy_all
Order.destroy_all
Customer.destroy_all
BikeOrder.destroy_all

josh = Customer.find_or_create_by(name: 'Joshua Burke', email: 'joshuaburke@email.com')
kevin = Customer.find_or_create_by(name: 'Kevin Heart', email: 'kevinheart@email.com')
classic_bike = Bike.find_or_create_by(name: 'Classic Bike', price: 300)
cheap_bike = Bike.find_or_create_by(name: 'Cheap Bike', price: 100)
rocket_bike = Bike.find_or_create_by(name: 'Rocket Bike', price: 1000)
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