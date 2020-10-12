FactoryBot.define do
  factory :purchase_address do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    municipality  { '名古屋市' }
    house_number  { '青山3−32−3' }
    building_name { 'レジデンス100' }
    tel           { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
