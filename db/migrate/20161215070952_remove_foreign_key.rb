class RemoveForeignKey < ActiveRecord::Migration
  def change
  	remove_foreign_key :posts, column: :campaign_id
  end
end
