class Order < ApplicationRecord
  belongs_to :customer
  has_many :bike_orders
  has_many :bikes, through: :bike_orders, source: :bike
  # has_and_belongs_to_many :bikes

  # validates :bikes, presence: true
  validates :customer, presence: true
end
