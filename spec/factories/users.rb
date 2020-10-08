FactoryBot.define do
  factory :user do
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    nickname               { Faker::Name.name }
    name_first             { ForgeryJa(:name).first_name }
    name_last              { ForgeryJa(:name).last_name }
    name_first_kana        { ForgeryJa(:name).first_name(to: ForgeryJa::KANA) }
    name_last_kana         { ForgeryJa(:name).last_name(to: ForgeryJa::KANA) }
    birth_day              { '2020-01-01' }
  end
end
