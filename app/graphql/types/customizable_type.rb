Types::CustomizableType = GraphQL::ObjectType.define do
  name 'Customizable'

  field :id, !types.ID

  field :name, !types.String
  field :options, -> { !types[Types::CustomizableOptionType] }, property: :customizable_options
end