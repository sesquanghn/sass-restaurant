FactoryBot.define do
  factory :registration_customer_form, class: Customers::RegistrationCustomerForm do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone }
    name_kana { 'マリア' }
  end
end
