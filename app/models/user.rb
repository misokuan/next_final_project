class User < ActiveRecord::Base
  include Clearance::User
  has_one :profile
  has_one :campaign 

end
