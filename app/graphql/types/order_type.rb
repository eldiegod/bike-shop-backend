Types::OrderType = GraphQL::ObjectType.define do
  # this type is named `Order`
  name 'Order'

  # it has the following fields
  field :id, !types.ID

  field :total, !types.Float
  field :customer, -> { Types::CustomerType }, property: :customer
  # field :bikes_sold, -> { !types[Types::BikeType] }, property: :bikes
  field :bike_orders, -> { !types[Types::BikeOrderType] }, property: :bike_orders
end