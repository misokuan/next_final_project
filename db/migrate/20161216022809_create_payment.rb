class CreatePayment < ActiveRecord::Migration
  def up
  	create_table :payments do |t|
		t.references :user , index:true  
		t.references :campaign , index:true  
		t.integer :transaction_amount 
		t.string :transaction_id 
    t.timestamps null: false
    end
  end

  def down 
  	drop_table :payments
  end
end
