class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|

    	t.string :user_uuid, :null => false, :limit => 20
    	t.string :service_uuid, :null => false, :limit => 20
    	t.string :time_slots, :default => "[]"
    	t.string :booking_token
    	t.string :status, :deafult => ""
      	t.timestamps
    end
  end
end
