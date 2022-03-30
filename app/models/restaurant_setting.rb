# == Schema Information
#
# Table name: public.restaurant_settings
#
#  id          :bigint           not null, primary key
#  close_hours :string
#  open_hours  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :bigint           not null
#
# Indexes
#
#  index_restaurant_settings_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class RestaurantSetting < ApplicationRecord
  belongs_to :account
end
