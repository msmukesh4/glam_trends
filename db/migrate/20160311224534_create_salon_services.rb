class CreateSalonServices < ActiveRecord::Migration
  def change
    create_table :salon_services do |t|
    	t.string :service_name
      	t.timestamps
    end
  end
end
