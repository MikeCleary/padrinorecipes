class Comment < ActiveRecord::Base
  belongs_to :recipe
  has_many :replies, :class_name => 'Comment', :foreign_key => :parent_id
end
