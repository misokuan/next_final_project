class Payment < ActiveRecord::Base
belongs_to :reward
belongs_to :user
belongs_to :campaign	
end
