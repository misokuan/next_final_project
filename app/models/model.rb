class Model < ActiveRecord::Base
  mount_uploader :file, ModelUploader
  attr_accessible :file
end