FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence(word_count: 3) }
    content { Faker::Lorem.paragraphs(number: 1) }
    association :user, factory: :user
  end
end
