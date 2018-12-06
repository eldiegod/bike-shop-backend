Types::CustomizableType = GraphQL::ObjectType.define do
  # this type is named `Customizable`
  name 'Customizable'

  # it has the following fields
  field :id, !types.ID

  field :name, !types.String
  # field :options, !types[!types.String]
  field :options, -> { !types[Types::CustomizableOptionType] }, property: :customizable_options
end