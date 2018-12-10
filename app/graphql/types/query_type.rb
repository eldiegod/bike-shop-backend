Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :allCustomers, !types[Types::CustomerType] do
    description "Get's all created Customers"
    resolve -> (obj, args, ctx) { Customer.all }
  end

  field :allOrders, !types[Types::OrderType] do
    description "Get's all created orders"
    resolve -> (obj, args, ctx) { Order.all }
  end

  field :allBikes, !types[Types::BikeType] do
    description "Get's all created bikes"
    resolve -> (obj, args, ctx) { Bike.all }
  end

  field :bike, Types::BikeType do
    argument :id, !types.Int
    description "Find a bike by it's id"
    resolve -> (obj, args, ctx) { Bike.find_by(id: args[:id]) }
  end
end
