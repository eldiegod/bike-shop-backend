class Resolvers::CreateCustomer < GraphQL::Function
  # arguments passed as "args"
  argument :name, !types.String
  argument :email, !types.String

  # return type from the mutation
  type Types::CustomerType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context
  def call(_obj, args, _ctx)
    Customer.create!(
      name: args[:name],
      email: args[:email],
    )
  end
end
