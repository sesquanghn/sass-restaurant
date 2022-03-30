class CreateRestaurantSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_settings do |t|
      t.string :open_hours
      t.string :close_hours
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
