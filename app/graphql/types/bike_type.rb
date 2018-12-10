Types::BikeType = GraphQL::ObjectType.define do
  name 'Bike'

  field :id, !types.ID
  field :name, !types.String
  field :price, !types.Float, description: "Price tag in Euros €"
  field :customizables, -> { !types[Types::CustomizableType] }, description: "Parts and options for the product that can be customized"

end