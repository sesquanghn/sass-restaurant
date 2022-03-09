FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone.scan(/\d+/).join }
    name_kana { 'マリア' }
  end
end
