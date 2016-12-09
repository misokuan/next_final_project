class Interest < ActiveRecord::Base
	belongs_to :category
	has_many :profile_interests
	has_many :profiles, :through => :profile_interests

end
