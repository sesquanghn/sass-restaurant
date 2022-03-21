class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :customer_capacity
      t.json :properties
      t.integer :state, default: 0
      t.references :floor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
