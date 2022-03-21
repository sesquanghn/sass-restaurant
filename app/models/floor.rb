# == Schema Information
#
# Table name: floors
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Floor < ApplicationRecord
  has_many :tables
end
