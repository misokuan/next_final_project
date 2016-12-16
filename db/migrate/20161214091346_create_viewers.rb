class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :stream, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
