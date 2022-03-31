# == Schema Information
#
# Table name: tables
#
#  id                :bigint           not null, primary key
#  customer_capacity :integer
#  discarded_at      :datetime
#  name              :string
#  properties        :json
#  state             :integer          default("available")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  floor_id          :bigint           not null
#
# Indexes
#
#  index_tables_on_floor_id  (floor_id)
#
# Foreign Keys
#
#  fk_rails_...  (floor_id => floors.id)
#
class Table < ApplicationRecord
  include Discardable

  belongs_to :floor

  enum state: [:available, :maintaince]
end
