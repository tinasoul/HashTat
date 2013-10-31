class User < ActiveRecord::Base
  after_create :welcome_email

  acts_as_voter
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_length_of :username, :maximum => 15, :allow_blank => false

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :location, :memorable_story, :about_me, :avatar
  mount_uploader :avatar, PictureUploader
  # Establish relationships between models
  has_many :tattoos
  has_many :comments
  has_one :artist

  # Calling the Tweet table not twitter api
  # after_create :assign_tweets_to_tattoos

  # def assign_tweets_to_tattoos
  #   if Tweet.where(:handle => self.username).present?
  #     Tweet.where(:handle => self.username).each do |entry|
  #       entry.attached_photos.each do |photo|
  #         Tattoo.create(user_id: self.id, twitter_photo: photo.media_url, hashtags: entry.hashtags)
  #       end
  #     end
  #   end
  # end


  def self.from_omniauth(auth)
    where(auth.slice(:provider,:uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.avatar = auth.info.image
    end
  end 

  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection:true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end 
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def welcome_email
     UserMailer.welcome_email(self).deliver
  end

end
