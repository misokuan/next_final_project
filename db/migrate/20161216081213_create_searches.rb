class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :words
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
