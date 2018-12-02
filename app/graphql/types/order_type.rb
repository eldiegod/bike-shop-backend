Types::OrderType = GraphQL::ObjectType.define do
  # this type is named `Order`
  name 'Order'

  # it has the following fields
  field :id, !types.ID

  field :total, !types.Float
  field :orderedBy, -> { Types::CustomerType }, property: :customer
  field :bikesSold, -> { !types[Types::BikeType] }, property: :bikes
end