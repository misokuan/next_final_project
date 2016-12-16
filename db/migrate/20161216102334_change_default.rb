class ChangeDefault < ActiveRecord::Migration
  def change
  	change_column_default(:campaigns, :total_contributors, 0)
  	change_column_default(:campaigns, :total_amount_contribute, 0)
  end
end
