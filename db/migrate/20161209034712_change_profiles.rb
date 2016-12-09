class ChangeProfiles < ActiveRecord::Migration
  def change
  	change_table :profiles do |t|
  		t.string :description 
  		t.string :username
  		t.date :date_of_birth
  		t.string :address
  		t.string :city 
  		t.string :interest, array:true
  		t.string :gender 
  		t.references :user , index:true  
		end
	end
end
