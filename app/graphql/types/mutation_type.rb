Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createCustomer, function: Resolvers::CreateCustomer.new
  field :createOrder, function: Resolvers::CreateOrder.new
  field :createBike, function: Resolvers::CreateBike.new
  field :createCustomizable, function: Resolvers::CreateCustomizable.new
end