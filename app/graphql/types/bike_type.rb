Types::BikeType = GraphQL::ObjectType.define do
  name 'Bike'

  field :id, !types.ID
  field :name, !types.String
  field :price, !types.Float
end