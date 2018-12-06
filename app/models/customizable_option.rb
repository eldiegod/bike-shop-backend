class CustomizableOption < ApplicationRecord
  belongs_to :customizable
  
  has_and_belongs_to_many :bike_orders
end
