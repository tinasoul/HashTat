class Artist < ActiveRecord::Base
  belongs_to :user
  attr_accessible :last_name, :first_name, :full_name, :location, :tattoo_shop, :avatar, :specialties, :bio, :instagram, :flickr, :twitter, :facebook, :cover_tattoo, :user_id
  validates_presence_of :first_name


  def full_name
    if self.first_name && self.last_name
      full_name = "#{self.first_name} #{self.last_name}"
      self.full_name = full_name
    else
        self.full_name = self.first_name
    end
  end
end