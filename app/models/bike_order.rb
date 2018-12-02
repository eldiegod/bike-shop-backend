class BikeOrder < ApplicationRecord
  belongs_to :order, validate: true
  belongs_to :bike, validate: true
end
