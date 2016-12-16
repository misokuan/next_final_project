class Reward < ActiveRecord::Base
  belongs_to :campaign
  has_one :payment
end
