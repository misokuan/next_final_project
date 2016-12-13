class CreateGoals < ActiveRecord::Migration
  def up
    create_table :goals do |t|
   		t.references :campaign, index:true 
   		t.string :title
   		t.string :description
   		t.integer :goal_per_month
   		t.integer :current_per_month
      t.timestamps null: false   
    end
  end

  def down 
  	drop_table :goals
  end
end