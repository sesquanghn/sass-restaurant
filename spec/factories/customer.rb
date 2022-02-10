FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone }
    name_kana { 'マリア' }
  end
end
