class AddDiscardedAtToTables < ActiveRecord::Migration[6.1]
  def change
    add_column :tables, :discarded_at, :datetime
  end
end
