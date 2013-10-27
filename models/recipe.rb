class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :steps
  has_many :ingredients
  has_many :comments
  has_many :recipe_tags
  has_many :tags, :through => :recipe_tags

  accepts_nested_attributes_for :ingredients, reject_if: Proc.new{ |attributes| attributes[:ingredient].blank? }
  accepts_nested_attributes_for :steps, reject_if: Proc.new{ |attributes| attributes[:steps].blank? }
end
