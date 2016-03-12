class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|

    	t.string :time_frame
      	t.timestamps
    end
  end
end
