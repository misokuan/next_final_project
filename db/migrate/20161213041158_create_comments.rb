class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true, foreign_key: true
      t.text :body
      t.string :image

      t.timestamps null: false
    end
  end
end
