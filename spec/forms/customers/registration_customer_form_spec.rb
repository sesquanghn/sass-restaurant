# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::RegistrationCustomerForm, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:name_kana) }

    it { should allow_value('マリア').for(:name_kana) }
    it { should allow_value('マリアsan').for(:name_kana) }
    it { should_not allow_value('myName').for(:name_kana) }
    it { should allow_value(Faker::Internet.email).for(:email) }
    it { should_not allow_value('myemail@email').for(:email) }
  end
end
