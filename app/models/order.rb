class Order < ApplicationRecord
  belongs_to :customer
  has_many :bike_order
  has_many :bikes, through: :bike_order, source: :bike

  # validates :bikes, presence: true
  validates :customer, presence: true
end
