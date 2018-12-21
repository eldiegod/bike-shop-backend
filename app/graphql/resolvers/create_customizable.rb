class Resolvers::CreateCustomizable < GraphQL::Function
  argument :name, !types.String
  argument :hasColors, types.Boolean, description: "Do the Customizable Options contain only colors?"
  argument :customizable_option_ids, types[types.ID], description: "The IDs of the Options this Customizable is going to have"

  type Types::CustomizableType

  def call(_obj, args, _ctx)
    Customizable.create!(
      name: args[:name],
      hasColors: args[:hasColors] || false,
      customizable_option_ids: args[:customizable_option_ids]
    )
  end
end
