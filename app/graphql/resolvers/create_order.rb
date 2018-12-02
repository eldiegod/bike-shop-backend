class Resolvers::CreateOrder < GraphQL::Function
  # arguments passed as "args"
  argument :customer_id, !types.Int
  # argument :customer_id, !types.Int
  argument :bike_ids, !types[!types.Int]
  # return type from the mutation
  type Types::OrderType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context
  def call(_obj, args, _ctx)
    order = Order.create!(
      customer_id: args[:customer_id],
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
    order.save()

    return order
  end
end
