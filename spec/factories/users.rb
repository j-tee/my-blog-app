FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    photo { Faker::Avatar.image }
    bio { Faker::Lorem.paragraph }
    posts_counter { 0 }
    # association :post
  end
end
