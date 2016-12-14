class CreateCampaigns < ActiveRecord::Migration
  def up
    create_table :campaigns do |t|
   		t.string :title
   		t.string :description 
   		t.string :rewards 
   		t.integer :total_contributors
   		t.integer :total_amount_contribute
   		t.string :cover_photo 
   		t.string :campaign_images 
   		t.string :taggings 
   		t.references :user, index:true 
      t.timestamps null: false   
    end
  end

  def down 
  	drop_table :campaigns
  end
end
