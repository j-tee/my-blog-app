FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.sentence }
    user
    post
  end
end
