class Campaign < ActiveRecord::Base
	belongs_to :user
	has_many :posts, dependent: :destroy 
end
