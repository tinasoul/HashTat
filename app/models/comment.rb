class Comment < ActiveRecord::Base
  attr_accessible :message, :tattoo_id, :comment_content
  validates :comment_content, :presence => true

  belongs_to :user
  belongs_to :tattoo
end
