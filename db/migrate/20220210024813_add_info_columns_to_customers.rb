class AddInfoColumnsToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :name_kana, :string
    add_column :customers, :postcode, :string
    add_column :customers, :prefecture, :string
    add_column :customers, :municipality, :string
    add_column :customers, :address, :string
    add_column :customers, :building_address, :string
    add_column :customers, :date_of_birth, :date
    add_column :customers, :is_male, :boolean
    add_column :customers, :email, :string
    add_column :customers, :remarks, :string
    add_column :customers, :company_name, :string
  end
end
