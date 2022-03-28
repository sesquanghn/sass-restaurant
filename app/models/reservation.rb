# == Schema Information
#
# Table name: reservations
#
#  id                :bigint           not null, primary key
#  discarded_at      :datetime
#  end_time          :datetime
#  number_of_guests  :integer
#  reservation_state :integer
#  start_time        :datetime
#  voucher_code      :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  customer_id       :bigint           not null
#  table_id          :bigint           not null
#  user_id           :integer
#
# Indexes
#
#  index_reservations_on_customer_id   (customer_id)
#  index_reservations_on_discarded_at  (discarded_at)
#  index_reservations_on_table_id      (table_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (table_id => tables.id)
#
class Reservation < ApplicationRecord
  include Discardable

  belongs_to :customer
  belongs_to :table
  belongs_to :user, optional: true
end
