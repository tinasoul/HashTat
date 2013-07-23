class Comment < ActiveRecord::Base
  attr_accessible :message, :tattoo_id

  belongs_to :user
  belongs_to :tattoo
end
