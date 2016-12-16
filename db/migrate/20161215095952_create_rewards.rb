class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.references :campaign, index: true, foreign_key: true
      t.decimal :amount
      t.string :description
      t.string :class

      t.timestamps null: false
    end
  end
end
