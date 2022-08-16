class CreateRouteStations < ActiveRecord::Migration[7.0]
  def change
    create_table :route_stations do |t|
      t.integer :route_id, null: false
      t.integer :station_id, null: false
      t.integer :station_order, null: false
      t.timestamps
    end
  end
end
