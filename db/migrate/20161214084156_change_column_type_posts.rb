class ChangeColumnTypePosts < ActiveRecord::Migration
  def change
  	remove_column(:posts, :image)
  	add_column(:posts, :post_images, :json)
  end
end
