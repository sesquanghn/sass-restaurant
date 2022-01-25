# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Accounts::RegistrationForm, type: :model do
  let(:valid_params) { attributes_for(:registration_account_form) }

  describe 'Validations' do
    it { should validate_presence_of(:company_name) }
    it { should validate_presence_of(:owner_name) }
    it { should validate_presence_of(:owner_email) }
    it { should validate_presence_of(:owner_password) }
    it { should validate_presence_of(:owner_password_confirmation) }
  end
end