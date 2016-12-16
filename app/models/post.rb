class Post < ActiveRecord::Base
  belongs_to :campaign
  has_many :comments

  mount_uploaders :post_images, PictureUploader
end
