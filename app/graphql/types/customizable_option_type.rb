Types::CustomizableOptionType = GraphQL::ObjectType.define do
  name 'CustomizableOption'

  field :id, !types.ID

  field :choice, !types.String, property: :name, description: "A choice to select from i.e. 'red' or 'black' or 'blue'"
  field :name, !types.String, property: :customizable_name, description: "Name of the Customizable part the option belongs to i.e 'Saddle'"
  field :price, !types.Float, description: "Added cost of this option"
  field :not_allowed_combinations, !types[Types::CustomizableOptionType], description: "Array of other options that are not choosable (or allowed) if this option is currently selected"
end