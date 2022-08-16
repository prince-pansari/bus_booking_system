class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :user_id, null: false
      t.integer :bus_id, null: false
      t.integer :route_id, null: false
      t.integer :num_ticket, null: false
      t.integer :fare, null: false
      t.references :starting_station, foreign_key: { to_table: 'stations' }
      t.references :ending_station, foreign_key: { to_table: 'stations' }

      t.timestamps
    end

  end
end
