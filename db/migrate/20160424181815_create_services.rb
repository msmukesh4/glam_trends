class CreateServices < ActiveRecord::Migration
    def change
        create_table :services do |t|

          	t.string :uuid, :null => false, :limit => 20
            t.string :shop_uuid, :null => false, :limit => 20
            t.integer :service_type, :null => false
            t.string :name
            t.integer :cost, :null => false

            t.timestamps
       end
    end
end
