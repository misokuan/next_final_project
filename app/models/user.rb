class User < ActiveRecord::Base
  include Clearance::User
  has_one :profile
end
