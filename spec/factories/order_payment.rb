FactoryBot.define do
  factory :order_payment do
    post_code { '123-4567' }
    region_id { 2 }
    city { '横浜県' }
    block { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '12345677890' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
