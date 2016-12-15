class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :campaign, index: true, foreign_key: true
      t.text :body
      t.string :image

      t.timestamps null: false
    end
  end
end
