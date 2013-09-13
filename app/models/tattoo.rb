class Tattoo < ActiveRecord::Base
  acts_as_voteable
  attr_accessible :picture, :description, :gender, :body_location, :studio, :artist_name, :hashtags, :location, :twitter_photo
  attr_accessible :picture, :description, :gender, :body_location, :studio, :artist_name, :hashtags, :location, :artist_id
  mount_uploader :picture, PictureUploader
  has_one :tweet
  has_many :comments
  belongs_to :user
  belongs_to :artist
 
  searchable do 
    text :description, :gender, :body_location, :studio, :artist_name, :hashtags, :location, :artist, :user
    text :username 
    text :full_name
  end
  delegate :username, to: :user
  delegate :full_name, to: :artist, allow_nil: true
end
