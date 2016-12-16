class RenameRewardsClassColumn < ActiveRecord::Migration
  def change
  	rename_column :rewards, :class, :rewards_class
  end
end
