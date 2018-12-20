class CustomizableOption < ApplicationRecord
  belongs_to :customizable

  has_and_belongs_to_many :bike_orders

  has_and_belongs_to_many :not_allowed_combinations,
  class_name: "CustomizableOption", 
  join_table: :constrains, 
  foreign_key: :customizable_option_id, 
  association_foreign_key: :constrain_customizable_option_id

  def customizable_name
    customizable.name
  end
end
