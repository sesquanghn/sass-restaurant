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
require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
