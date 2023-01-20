FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    text { Faker::Lorem.paragraph }
    comments_counter { Faker::Number.between(from: 1, to: 100) }
    likes_counter { Faker::Number.between(from: 1, to: 100) }
    # association :user
    user
  end
end
