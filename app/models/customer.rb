# == Schema Information
#
# Table name: customers
#
#  id                :bigint           not null, primary key
#  address           :string
#  building_address  :string
#  company_name      :string
#  customer_type     :integer
#  date_of_birth     :date
#  discarded_at      :datetime
#  email             :string
#  gender            :integer          default("male")
#  last_visited_date :datetime
#  municipality      :string
#  name              :string
#  name_kana         :string
#  number_of_visits  :integer
#  phone             :string
#  postcode          :string
#  prefecture        :string
#  remarks           :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_customers_on_discarded_at  (discarded_at)
#
class Customer < ApplicationRecord
  include Discardable

  enum customer_type: [:individual, :grouped]
  enum gender: [:male, :female]

  scope :by_id, ->(id) { where(id: id) }
  scope :by_phone, ->(phone) { where(phone: phone) }
  scope :by_name_start_with, ->(name) { where("customers.name LIKE ?", "#{name}%") }
  scope :by_customer_type, ->(customer_type) { where(customer_type: customer_type) }
end
