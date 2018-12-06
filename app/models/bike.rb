class Bike < ApplicationRecord
  has_and_belongs_to_many :customizables
  # has_and_belongs_to_many :orders

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
