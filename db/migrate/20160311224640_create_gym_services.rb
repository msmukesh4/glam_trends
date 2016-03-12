class CreateGymServices < ActiveRecord::Migration
  def change
    create_table :gym_services do |t|

    	t.string :service_name
      	t.timestamps
    end
  end
end
