class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :bus_number, index: true
      t.integer :route_id

      t.timestamps
    end
  end
end
