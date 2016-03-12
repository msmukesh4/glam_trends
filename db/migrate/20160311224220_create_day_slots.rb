class CreateDaySlots < ActiveRecord::Migration
  def change
    create_table :day_slots do |t|

    	t.string :day
      t.timestamps
    end
  end
end
