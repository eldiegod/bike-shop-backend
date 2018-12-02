class Order < ApplicationRecord
  belongs_to :customer
  has_many :bikes

  # validates :bikes, presence: true
  validates :customer, presence: true
  validates :total, presence: true
end
