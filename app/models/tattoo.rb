class Tattoo < ActiveRecord::Base
  acts_as_voteable
  attr_accessible :picture, :description, :gender, :body_location, :studio, :artist, :hashtags, :location
  mount_uploader :picture, PictureUploader
  has_many :comments

  # searchable do 
  #   text :gender, :body_location, :studio, :artist, :hashtags, :location
  # end

end
