class ChangeColumnType < ActiveRecord::Migration
  def change
  	remove_column(:campaigns, :campaign_images)
  	add_column(:campaigns, :campaign_images, :json)
  end
end
