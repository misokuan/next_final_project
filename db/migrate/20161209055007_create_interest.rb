class CreateInterest < ActiveRecord::Migration
  def change
    create_table :interests do |t|
    	t.string :interest_name
    	t.references :category, index: true
    end
  end
end
