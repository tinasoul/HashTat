class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :tattoos
  attr_accessible :last_name, :first_name, :full_name, :location, :tattoo_shop, :avatar, :specialties, :bio, :instagram, :flickr, :twitter, :facebook, :cover_tattoo, :user_id
  require "uri"

  validates_presence_of :first_name
  validates :twitter, :format => { without: /\W/, allow_blank: true, :message => 'Enter a vaild twitter handle without @.'}
  validates :flickr, :format => { without: /\W/, allow_blank: true, :message => 'Enter a valid flickr username or a link to your flickr profile.'}
  validates :instagram, :format => { without: /\W/, allow_blank: true, :message => 'Enter a valid instagram username or a link to your instagram profile.'}
  validates :facebook, :format => { without: /\W/, allow_blank: true, :message => 'Enter a valid facebook url.'}


  # Public: Creates a "full name" for the artist, which is a combination of first and last name
  # If only first name exists, full name is set as first name
  # Will be used for searching through artists and potentially for artist route
  def full_name
    if self.first_name && self.last_name
      full_name = "#{self.first_name} #{self.last_name}"
      self.full_name = full_name
    else
      self.full_name = self.first_name
    end
  end

end