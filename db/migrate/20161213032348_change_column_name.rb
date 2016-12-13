class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :posts, :user_id, :campaign_id
  end
end
