class Resolvers::CreateBike < GraphQL::Function
  argument :name, !types.String
  argument :price, !types.Float

  type Types::BikeType

  def call(_obj, args, _ctx)
    Bike.create!(
      name: args[:name],
      price: args[:price],
    )
  end
end
