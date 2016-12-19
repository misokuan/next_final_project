class Profile < ActiveRecord::Base
	has_many :profile_interests
	has_many :interests, :through => :profile_interests
	belongs_to :user
	acts_as_birthday :date_of_birth
	mount_uploader :avatar, AvatarUploader

	def full_name
	  if self.first_name != nil || self.last_name != nil
		return "#{self.first_name.titleize} #{self.last_name.titleize}"
	  else
	  	return "N/A"
	  end
	end
end
