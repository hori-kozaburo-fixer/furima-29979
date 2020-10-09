FactoryBot.define do
  factory :item do
    name                  { Faker::Name.name }
    text                  { Faker::Lorem.sentence }
    category_id           { '2' }
    status_id             { '2' }
    delivery_fee_id       { '2' }
    sender_area_id        { '2' }
    number_of_day_id      { '2' }
    money                 { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
