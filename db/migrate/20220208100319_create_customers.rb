class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.integer :number_of_visits
      t.datetime :last_visited_date
      t.integer :customer_type

      t.timestamps
    end
  end
end
