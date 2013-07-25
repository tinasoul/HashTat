class Tattoo < ActiveRecord::Base
  attr_accessible :picture, :description, :gender, :body_location, :studio, :artist, :hashtags, :location
  mount_uploader :picture, PictureUploader
  has_many :comments
end
