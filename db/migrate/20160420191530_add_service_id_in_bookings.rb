class AddServiceIdInBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :service_name, :string
  	add_column :bookings, :service_type, :string
  end
end
