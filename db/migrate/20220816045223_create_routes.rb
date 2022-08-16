class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :route_name, null: false
      t.references :starting_station, foreign_key: { to_table: 'stations' }
      t.references :ending_station, foreign_key: { to_table: 'stations' }
      t.timestamps
    end

  end
end
