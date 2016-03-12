class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string   :first_name
	    t.string   :last_name
	    t.string   :password
	    t.string   :email
	    t.string   :uuid, :limit => 20,   :null => false
	    t.string   :contact_number1,      :limit => 10
	    t.string   :contact_number2,      :limit => 10
	    t.date     :last_logged_in
	    t.boolean  :is_first_logged_in,   :default => false
	    t.boolean  :is_super_user, 		  :default => false
	    t.boolean  :is_owner,      		  :default => false
	    t.integer  :failed_attempts, 	  :default => 0
	    t.string   :loyality_discount_at, :default => "[]"
	    t.string   :user_last_location,   :default => ""
	    t.string   :status,               :default => "Active"
	    t.integer  :number_of_bookings,   :default => 0
	    t.integer  :transaction,          :limit => 8,  :default => 0
      	
      	t.timestamps
    end
  end
end
