class BikeOrder < ApplicationRecord
  belongs_to :order, validate: true
  belongs_to :bike, validate: true
  
  has_and_belongs_to_many :customizable_options
end
