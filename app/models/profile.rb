class Profile < ActiveRecord::Base
	has_many :profile_interests
	has_many :interests, :through => :profile_interests
	belongs_to :user
	mount_uploaders :avatars, AvatarUploader
end
