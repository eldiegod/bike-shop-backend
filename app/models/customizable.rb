class Customizable < ApplicationRecord
  has_and_belongs_to_many :bikes
  has_many :customizable_options
end
