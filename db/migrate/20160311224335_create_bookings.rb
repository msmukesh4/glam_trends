class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|

      t.string :uuid, :null => false, :limit => 20
    	t.string :user_uuid, :null => false, :limit => 20
    	t.string :service_uuid, :null => false, :limit => 20
    	t.string :time_slots, :default => "[]"
    	t.string :booking_token
      t.integer :cost
    	t.string :status, :default => "Active"
      t.timestamps
    end
  end
end
