# == Schema Information
#
# Table name: public.accounts
#
#  id           :bigint           not null, primary key
#  company_name :string
#  subdomain    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer
#
class Account < ApplicationRecord
  belongs_to :owner, class_name: 'User', optional: true
end
