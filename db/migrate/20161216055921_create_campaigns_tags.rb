class CreateCampaignsTags < ActiveRecord::Migration
  def change
    create_table :campaigns_tags, :id => false do |t|
    t.references :campaign, index: true, foreign_key: true
    t.references :tag, index: true, foreign_key: true    
    end
  end
end