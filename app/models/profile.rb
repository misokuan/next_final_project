class Profile < ActiveRecord::Base
	has_many :profile_interests
	has_many :interests, :through => :profile_interests
	belongs_to :user
	acts_as_birthday :date_of_birth
	mount_uploader :avatar, AvatarUploader

	def full_name
	  a = self.first_name.titleize if self.first_name != nil
	  b = self.last_name.titleize if self.last_name != nil
	  if a != nil && b != nil
	  	return "#{a} #{b}"
	  elsif a != nil && b == nil
	  	return "#{a}"
	  elsif a == nil && b != nil
	  	return "#{b}"
	  else
	  	return "N/A"
	  end
	end
end
