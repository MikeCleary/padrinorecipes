class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :steps
  has_many :ingredients
end
