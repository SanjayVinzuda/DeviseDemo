class User < ActiveRecord::Base
  # before_save :create_remember_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :omniauthable, :omniauth_providers => [:facebook]

  def remember_me
    true
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.firstname = auth.info.firstname   # assuming the user model has a name
      user.lastname = auth.info.lastname
      # @image = auth.info.image
      # @uid = auth.uid
      # @urls = auth.info.urls
      # @dob = auth.info.last_name



      puts "-------____#{@dob}"
      # assuming the user model has an image
      # dob = auth.info.dob
      # $auth = request.env["omniauth.auth"]

    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"]  && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def largeimage
    "http://graph.facebook.com/#{self.uid}/picture?type=large"
  end
  def normalimage
    "http://graph.facebook.com/#{self.uid}/picture?type=normal"
  end
  def smallimage
    "http://graph.facebook.com/#{self.uid}/picture?type=small"
  end

end
