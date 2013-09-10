class Tattoo < ActiveRecord::Base
  acts_as_voteable
  attr_accessible :picture, :description, :gender, :body_location, :studio, :artist_name, :hashtags, :location, :twitter_photo
  attr_accessible :picture, :description, :gender, :body_location, :studio, :artist_name, :hashtags, :location, :artist_id
  mount_uploader :picture, PictureUploader
  has_one :tweet
  has_many :comments
  belongs_to :user
  belongs_to :artist

end
