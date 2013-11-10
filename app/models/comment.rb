class Comment < ActiveRecord::Base
  attr_accessible :message, :tattoo_id, :comment_content, :artist_id
  attr_accessible :id, :user_id, :tattoo_id, :comment_content, :created_at, 
                  :updated_at, :artist_id, :as => [:default, :admin]

  validates :comment_content, :presence => true

  belongs_to :user
  belongs_to :tattoo
  belongs_to :artist
end
