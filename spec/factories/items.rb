FactoryBot.define do
  factory :item do
    
     name {Faker::Name.name}
     explanation {Faker::Lorem.sentence}
     category_id{2}
     situation_id{2}
     load_id{2}
     region_id{2}
     shipping_id{2}
     price{300}
     association :user

     after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.png'), filename: 'sample.png')
     end
  end
end
