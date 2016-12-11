class User < ActiveRecord::Base
  include Clearance::User
  has_one :profile
  has_one :campaign
  has_many :authentications, :dependent => :destroy  # attr_accessible :password, :password_confirmation
  # validates_confirmation_of :password_confirmation
  # validates_confirmation_of :password
  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

  def validate_password
    raise PasswordDoesNotMatch if password_confirmation != password
  end   
end

class PasswordDoesNotMatch < StandardError; end 
