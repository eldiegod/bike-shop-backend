class Resolvers::CreateOrder < GraphQL::Function
  CustomBikeInput = GraphQL::InputObjectType.define do
    name 'CustomBike'
    argument :bike_id, !types.Int
    argument :option_ids, !types[!types.Int]
  end

  argument :customer_email, !types.String
  argument :custom_bikes, !types[!CustomBikeInput]

  type Types::OrderType

  def call(_obj, args, _ctx)
    order = Order.create!(
      customer_id: Customer.find_or_create_by(email: args[:customer_email]).id
    ) 
    # add each bike to the order
    args[:custom_bikes].each do |custom_bike|
      order.bike_orders.create!(
        bike_id: custom_bike.bike_id
      )
      .customizable_options = CustomizableOption.find(custom_bike.option_ids)

      # sum each ordered bike price to the orders total
      order.total += Bike.find(custom_bike.bike_id).price
    end
    # save the modified order
    order.save()

    return order
  end
end
