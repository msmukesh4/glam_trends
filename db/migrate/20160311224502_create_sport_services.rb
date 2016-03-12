class CreateSportServices < ActiveRecord::Migration
  def change
    create_table :sport_services do |t|

    	t.string :service_name
      	t.timestamps
    end
  end
end
