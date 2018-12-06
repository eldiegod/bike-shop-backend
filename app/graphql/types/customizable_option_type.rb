Types::CustomizableOptionType = GraphQL::ObjectType.define do
  # this type is named `CustomizableOption`
  name 'CustomizableOption'

  # it has the following fields
  field :id, !types.ID

  field :name, !types.String
end