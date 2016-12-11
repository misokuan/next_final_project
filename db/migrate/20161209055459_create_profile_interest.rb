class CreateProfileInterest < ActiveRecord::Migration
  def change
    create_table :profile_interests do |t|
    	t.references :profile , index: true
    	t.references :interest, index: true
    end
  end
end
