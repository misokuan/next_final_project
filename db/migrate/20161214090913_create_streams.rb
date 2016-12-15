class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.string :status
      t.string :opentok_session_id

      t.timestamps null: false
    end
  end
end
