class Comment < ActiveRecord::Base
  attr_accessible :message, :tattoo_id, :comment_content, :artist_id
  validates :comment_content, :presence => true

  belongs_to :user
  belongs_to :tattoo
  belongs_to :artist
end
