class Tattoo < ActiveRecord::Base
  acts_as_voteable
  attr_accessible :picture, :description, :gender, :body_location, :studio, :artist_name, :hashtags, :location
  mount_uploader :picture, PictureUploader
  has_many :comments
  belongs_to :artist, class_name: 'User', foreign_key: 'artist_id'
  belongs_to :user
  
  # searchable do 
  #   text :description :gender, :body_location, :studio, :artist, :hashtags, :location
  # end

  # def self.search(query, params={})
  #   solr_search do

  #     fulltext query do
  #       minimum_match 1
  #     end

  #     paginate :page => params[:page], :per_page => params[:per_page]
  #   end
  # end

end
