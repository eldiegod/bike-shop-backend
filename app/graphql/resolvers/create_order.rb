class Resolvers::CreateOrder < GraphQL::Function
  argument :customer_email, !types.String
  argument :bike_ids, !types[!types.Int]

  type Types::OrderType

  def call(_obj, args, _ctx)
    order = Order.create!(
      customer_id: Customer.find_by(email: args[:customer_email]).id,
      total: 0
    ) 
    # add each bike to the order
    args[:bike_ids].each do |bike_id|
      BikeOrder.create!(
        order_id: order.id,
        bike_id: bike_id
      )
      # sum each ordered bike price to the orders total
      order.total += Bike.find_by(id: bike_id).price
    end
    # save the modified order
    order.save()

    return order
  end
end
