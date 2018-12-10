Types::CustomizableType = GraphQL::ObjectType.define do
  name 'Customizable'

  field :id, !types.ID

  field :name, !types.String, description: "Name of the Customizable part i.e 'Saddle'"
  field :hasColors, !types.Boolean, description: "Do the Customizable Options contain only colors?"
  field :options, -> { !types[Types::CustomizableOptionType] }, property: :customizable_options, description: "Choices to select from i.e. ['15 inches','17 inches','19 inches'] or ['red','black','blue']"
end