class Campaign < ActiveRecord::Base
	belongs_to :user 
	belongs_to :goal

	has_many :payments
	has_many :rewards
	has_many :posts, dependent: :destroy 
  has_and_belongs_to_many :tags
  include PgSearch
  multisearchable :against => [:title, :description, :taggings]

  after_create do
    if self.taggings.nil? == false
      campaign = Campaign.find_by(id: self.id)
      #find the campaign ID itself
      hashtags = self.taggings.scan(/#\w+/)
      #scans campaign body that starts with #
      hashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        campaign.tags << tag
      end
    end
  end

  before_update do
    campaign = Campaign.find_by(id: self.id)
    campaign.tags.clear #delete all and add again
    hashtags = self.taggings.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      campaign.tags << tag
    end
  end
	mount_uploaders :campaign_images, PictureUploader
	mount_uploader :cover_photo, AvatarUploader
end
