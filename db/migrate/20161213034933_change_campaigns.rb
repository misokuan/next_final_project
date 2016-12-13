class ChangeCampaigns < ActiveRecord::Migration
  def up 
  	change_table :campaigns do |t|
  		t.references :goal, index:true 
  	end
  end

  def down 
  	remove_column :campaigns, :goal, index:true
  end
end
