# == Schema Information
#
# Table name: customers
#
#  id                :bigint           not null, primary key
#  customer_type     :integer
#  discarded_at      :datetime
#  last_visited_date :datetime
#  name              :string
#  number_of_visits  :integer
#  phone             :string
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
end
