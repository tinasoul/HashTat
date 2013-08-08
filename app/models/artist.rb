class Artist < ActiveRecord::Base
  belongs_to :user
  attr_accessible :last_name, :first_name, :full_name, :location, :tattoo_shop, :avatar, :specialties, :bio, :instagram, :flickr, :twitter, :facebook, :cover_tattoo, :user_id



  def full_name
    full_name = "#{self.first_name} #{self.last_name}"
    self.full_name = full_name
  end
end