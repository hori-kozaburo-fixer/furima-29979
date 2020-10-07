FactoryBot.define do
  factory :user do
    email                  {Faker::Interner.free_mail}
    password               {Faker::Internet.free_email}
    password_confirmation  {password}
    nickname               {Faker::Name.name}
    name_first             {Faker::Name.first_name}
    name_last              {Faker::Name.last_name}
    name_first_kana        {Faker::Name.first_kana_name}    
    name_last_kana         {Faker::Name.last_kana_nane}              
  end
end
