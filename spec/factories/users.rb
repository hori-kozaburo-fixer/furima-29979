FactoryBot.define do
  factory :user do
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    nickname               {Faker::Name.name}
    name_first             {Faker::Name.first_name}
    name_last              {Faker::Name.last_name}
    name_first_kana        {ForgeryJa(:name).first_name(:to => ForgeryJa::KANA)}    
    name_last_kana         {ForgeryJa(:name).last_name(:to => ForgeryJa::KANA)}              
  end
end
