class Campaign < ActiveRecord::Base
	belongs_to :user 
	belongs_to :goal
	belongs_to :user
	has_many :rewards
	has_many :posts, dependent: :destroy 
	mount_uploaders :campaign_images, PictureUploader
	mount_uploader :cover_photo, AvatarUploader
end
