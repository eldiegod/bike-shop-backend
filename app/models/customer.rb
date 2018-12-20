class Customer < ApplicationRecord
  has_many :orders
  # has_many :bikes :through => :orders

  validates :email, presence: true, uniqueness: true
end
