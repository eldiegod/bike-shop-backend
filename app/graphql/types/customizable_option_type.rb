Types::CustomizableOptionType = GraphQL::ObjectType.define do
  # this type is named `CustomizableOption`
  name 'CustomizableOption'

  # it has the following fields
  field :id, !types.ID

  # field :name, !types.String
  field :choice, !types.String, property: :name
  field :name, !types.String, property: :customizable_name
end