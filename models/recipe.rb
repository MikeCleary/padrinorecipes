class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :steps
  has_many :ingredients

  accepts_nested_attributes_for :ingredients, reject_if: Proc.new{ |attributes| attributes[:ingredient].blank? }
  accepts_nested_attributes_for :steps, reject_if: Proc.new{ |attributes| attributes[:steps].blank? }
end
