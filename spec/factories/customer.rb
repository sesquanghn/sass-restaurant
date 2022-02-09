FactoryBot.define do
  factory :customer do
    name { "MyName" }
    phone { "MyPhone" }
    number_of_visits { 1 }
    last_visited_date { "2022-02-08 10:03:19" }
    customer_type { 'grouped' }
  end
end