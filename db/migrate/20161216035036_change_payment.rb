class ChangePayment < ActiveRecord::Migration
  def up
  	change_table :payments do |t|
  		t.references :reward, index:true 
  	end
  end
  def down 
  	remove_column :payments, :reward
  end
end
