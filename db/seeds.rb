Bike.destroy_all
Order.destroy_all
BikeOrder.destroy_all
Customer.destroy_all
Customizable.destroy_all
CustomizableOption.destroy_all

# customers
josh = Customer.find_or_create_by(name: 'Joshua Burke', email: 'joshuaburke@email.com')
kevin = Customer.find_or_create_by(name: 'Kevin Heart', email: 'kevinheart@email.com')
# bikes
Bike.find_or_create_by(name: 'Classic Bike', price: 300)
Bike.find_or_create_by(name: 'Cheap Bike', price: 100)
Bike.find_or_create_by(name: 'Rocket Bike', price: 2000)
Bike.find_or_create_by(name: 'Kids Bike', price: 150)
Bike.find_or_create_by(name: 'Race Bike', price: 275)
Bike.find_or_create_by(name: 'Hip Bike', price: 999.99)
Bike.find_or_create_by(name: 'iBike', price: 2999.99)
Bike.find_or_create_by(name: 'Best Bike', price: 300)
# customizables and options
wheel_size = Customizable.create(name: 'Wheel Size', hasColors: false)
wheel_size.customizable_options.create([{name:'15″'}, {name:'17″', price: 15}, {name:'19″', price: 25}])
rim_color = Customizable.create(name: 'Rim Color')
rim_color.customizable_options.create([{name:'red'}, {name:'green'}, {name:'blue'}, {name:'green-light' }, {name:'yellow'}])
# add some constrains
saddle_color = Customizable.create(name: 'Wheels Color')
saddle_color.customizable_options.create([{name:'black'}, {name:'grey'}, {name:'teal'}])
CustomizableOption.first.not_allowed_combinations =  [
  CustomizableOption.find_by(name:'grey'), CustomizableOption.find_by(name:'blue'),
  CustomizableOption.find_by(name:'green'), CustomizableOption.find_by(name:'green-light'),
  CustomizableOption.find_by(name:'teal'), CustomizableOption.find_by(name:'yellow'),
]
CustomizableOption.second.not_allowed_combinations =  [CustomizableOption.find_by(name:'green-light'), CustomizableOption.find_by(name:'yellow'),CustomizableOption.find_by(name:'teal')]

# add all Customizables to all bikes
Bike.all().each do |b| 
  b.customizables = Customizable.all()
end
# orders
joshs_order = josh.orders.create(customer_id: josh.id, total: 0)
Bike.all().each do |b| 
  joshs_order
    .bike_orders.create(bike: b)
    .customizable_options=[wheel_size.customizable_options[0], rim_color.customizable_options[0], saddle_color.customizable_options[0]]
  joshs_order.total += b.price
end

p "seeded db"
p "joshs_order has #{joshs_order.total} debt and bought #{joshs_order.bikes.map{ |b| b.name }}"
p "and every bike he bought had this options #{joshs_order.bike_orders[0].customizable_options.map{ |co| co.customizable.name + ': ' + co.name  }}"
p "#{wheel_size.name} has #{wheel_size.customizable_options.map{ |o| [o.name, o.price, o.not_allowed_combinations.map{ |not_allowed| not_allowed.name }] }} options"
p "#{rim_color.name} has #{rim_color.customizable_options.map{ |o| o.name }} options"