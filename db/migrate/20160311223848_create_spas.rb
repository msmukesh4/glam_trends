class CreateSpas < ActiveRecord::Migration
  def change
    create_table :spas do |t|

    	t.string :name, :null => false
    	t.integer :user_id, :null => false
    	t.string :icon, :limit => 500
    	t.string :banner, :limit =>500
    	t.string :uuid, :limit => 20, :null => false
    	t.integer :offer_id, :default => 0
    	t.string :service_type_ids, :default => "[]"
    	t.string :time_slot_ids, :default => "[]"
        t.string :status, :default => "Active"
    	t.string :contact_number1, :limit => 10
    	t.string :contact_number2, :limit => 10
    	t.integer :location_id
    	t.decimal :latitide, :default => 0.0, :precision => 9, :scale => 6
    	t.decimal :longitude, :default => 0.0, :precision => 9, :scale => 6
    	t.integer :booking_count, :default => 0
    	t.string :caption, :default => ""
    	t.string :details, :default => "", :limit => 1000
    	t.string :address, :limit => 1000

      	t.timestamps
    end
    add_index(:spas, :user_id)
    add_index(:spas, :offer_id)
    add_index(:spas, :location_id)
  end
end
