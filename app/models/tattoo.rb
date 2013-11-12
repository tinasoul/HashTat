class Tattoo < ActiveRecord::Base
  acts_as_voteable
  attr_accessible :user_id, :picture, :description, :gender, :body_location, 
                  :studio, :artist_name, :hashtags, :location, :twitter_photo, 
                  :artist_id

  attr_accessible :id, :picture, :description, :gender, :body_location, :studio, 
                  :artist_name, :hashtags, :user_id, :created_at, :updated_at, 
                  :location, :artist_id, :twitter_photo, :as => [:default, :admin]

  mount_uploader :picture, PictureUploader
  validates_presence_of :picture
  
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
