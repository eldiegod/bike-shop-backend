Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # queries are just represented as fields
  field :allCustomers, !types[Types::CustomerType] do
    resolve -> (obj, args, ctx) { Customer.all }
  end

  field :allOrders, !types[Types::OrderType] do
    resolve -> (obj, args, ctx) { Order.all }
  end

  field :allBikes, !types[Types::BikeType] do
    resolve -> (obj, args, ctx) { Bike.all }
  end
end
