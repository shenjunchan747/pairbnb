class User < ApplicationRecord
  include Clearance::User


  has_many :authentications, :dependent => :destroy
  has_many :listings

  
  validates :first_name, presence: true
  enum access_level: [:customer, :moderator, :superadmin]



  def self.create_with_auth_and_hash(authentication, auth_hash)
    
    # user = User.create(first_name: auth_hash["first_name"], last_name: auth_hash["last_name"], email: auth_hash["extra"]["raw_info"]["email"])
    byebug #auth_hash
    user = User.create!(first_name: auth_hash["extra"]["raw_info"]["first_name"],last_name: auth_hash["extra"]["raw_info"]["last_name"],email: auth_hash["extra"]["raw_info"]["email"])
    
    #user.new
    #user.save

    user.authentications << (authentication)

    return user

  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

end


