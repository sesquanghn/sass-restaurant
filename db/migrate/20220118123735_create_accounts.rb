class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :subdomain
      t.integer :owner_id
      t.string :company_name

      t.timestamps
    end
  end
end
