class CreateSpaServices < ActiveRecord::Migration
  def change
    create_table :spa_services do |t|
    	t.string :service_name
      	t.timestamps
    end
  end
end
