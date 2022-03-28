class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :voucher_code
      t.integer :number_of_guests
      t.integer :reservation_state
      t.integer :user_id
      t.datetime :discarded_at
      t.references :customer, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true

      t.timestamps

      t.index :discarded_at
    end
  end
end
