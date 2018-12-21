class Resolvers::CreateBike < GraphQL::Function
  argument :name, !types.String
  argument :price, !types.Float
  argument :customizable_ids, types[types.ID], description: "The IDs of the Customizables this bike is going to have"

  type Types::BikeType

  def call(_obj, args, _ctx)
    Bike.create!(
      name: args[:name],
      price: args[:price],
      customizable_ids: args[:customizable_ids]
    )
  end
end
