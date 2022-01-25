FactoryBot.define do
  factory :registration_account_form, class: Accounts::RegistrationForm do
    company_name                      { 'thinhdo' }
    owner_email                       { Faker::Internet.email }
    owner_name                        { Faker::Name.name }
    owner_password                    { 'password' }
    owner_password_confirmation       { 'password' }
  end
end
