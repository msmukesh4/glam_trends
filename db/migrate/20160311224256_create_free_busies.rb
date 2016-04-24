class CreateFreeBusies < ActiveRecord::Migration
  def change
    create_table :free_busies do |t|

    	t.string :uuid , :null => false, :limit => 20
    	t.integer :time_slot_1, :defaut => 0
    	t.integer :time_slot_2, :defaut => 0
    	t.integer :time_slot_3, :defaut => 0
    	t.integer :time_slot_4, :defaut => 0
    	t.integer :time_slot_5, :defaut => 0
    	t.integer :time_slot_6, :defaut => 0
    	t.integer :time_slot_7, :defaut => 0
    	t.integer :time_slot_8, :defaut => 0
    	t.integer :time_slot_8, :defaut => 0
    	t.integer :time_slot_9, :defaut => 0
    	t.integer :time_slot_10, :defaut => 0
    	t.integer :time_slot_11, :defaut => 0
    	t.integer :time_slot_12, :defaut => 0
    	t.integer :time_slot_13, :defaut => 0
    	t.integer :time_slot_14, :defaut => 0
    	t.integer :time_slot_15, :defaut => 0
    	t.integer :time_slot_16, :defaut => 0
    	t.integer :time_slot_17, :defaut => 0
    	t.integer :time_slot_18, :defaut => 0
    	t.integer :time_slot_19, :defaut => 0
    	t.integer :time_slot_20, :defaut => 0
    	t.integer :time_slot_21, :defaut => 0
    	t.integer :time_slot_22, :defaut => 0
    	t.integer :time_slot_23, :defaut => 0
    	t.timestamps
    end
  end
end
