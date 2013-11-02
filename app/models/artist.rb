class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :tattoos
  has_many :comments
  attr_accessible :last_name, :first_name, :full_name, :location, :tattoo_shop, :avatar, :specialties, :bio, :instagram, :flickr, :twitter, :facebook, :cover_tattoo, :user_id, :email, :phone, :tattoo_shop_url, :color_scheme, :vanity_url
  attr_accessible :id, :first_name, :last_name, :full_name, :location, 
                  :tattoo_shop, :avatar, :specialties, :bio, :instagram, 
                  :flickr, :twitter, :facebook, :cover_photo, :created_at, 
                  :updated_at, :user_id, :tattoo_shop_url, :email, :phone, 
                  :color_scheme, :vanity_url, :as => [:default, :admin]

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover_photo, CoverphotoUploader


  require "uri"
  validates_uniqueness_of :vanity_url, allow_blank: true, :message => 'url not available'
  validates_format_of :vanity_url, :without => /^\d/, allow_blank:true
  validates_presence_of :first_name
  validates :twitter, :format => { without: /\W/, allow_blank: true, :message => 'Enter a vaild twitter handle without @, or a link to your twitter.'}
  validates :flickr, :format => { without: /\W/, allow_blank: true, :message => 'Enter a valid flickr username or a link to your flickr profile.'}
  validates :instagram, :format => { without: /\W/, allow_blank: true, :message => 'Enter a valid instagram username without @, or a link to your instagram profile.'}
  validates :facebook, :format => { without: /\W/, allow_blank: true, :message => 'Enter a valid facebook url.'}
  # validates_presence_of :bio, :message => 'Please enter a short bio. We want to know something about you!'
  # validates_presence_of :specialties, :message => "We know you're good at something!"

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

  def to_param
    self.vanity_url
  end

  def self.find(input)
    if input.to_i != 0
      super
    else
        find_by_vanity_url(input)
    end
  end

end