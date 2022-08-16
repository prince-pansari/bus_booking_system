class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :number, index: true
      t.boolean :verified, default: false
      t.string :token
      t.timestamps
    end
  end
end
