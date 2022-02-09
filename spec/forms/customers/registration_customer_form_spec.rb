# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::RegistrationCustomerForm, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:number_of_visits) }
    it { should validate_presence_of(:last_visited_date) }
    it { should validate_presence_of(:customer_type) }
  end
end
