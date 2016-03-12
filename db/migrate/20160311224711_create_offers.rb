class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|

    	t.string :offer
      	t.datetime :start_date_time
      	t.datetime :end_date_time
    	t.boolean :is_day_offer
    	t.boolean :is_time_slot_offer
    	t.string :time_slot, :default => "[]"
    	t.string :day_slot, :default => "[]"
    	t.integer :discount, :default => 0  # in percentage
      	t.timestamps
    end
  end
end
