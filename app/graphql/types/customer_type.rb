Types::CustomerType = GraphQL::ObjectType.define do
  # this type is named `Customer`
  name 'Customer'

  # it has the following fields
  field :id, !types.ID
  field :name, !types.String
  field :email, !types.String
  # field :orders, -> { Types::OrderType }, property: :orders

end