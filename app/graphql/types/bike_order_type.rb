Types::BikeOrderType = GraphQL::ObjectType.define do
  name 'BikeOrder'

  field :id, !types.ID

  field :order, -> { Types::OrderType }
  field :bike, -> { Types::BikeType }
  field :options, -> { !types[Types::CustomizableOptionType] }, property: :customizable_options
end