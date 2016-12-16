class DropJoinTables < ActiveRecord::Migration
  def change
  	drop_join_table :posts, :tags
  end
end
