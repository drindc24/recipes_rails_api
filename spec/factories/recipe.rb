FactoryBot.define do
  factory :recipe do
    category

    user

    # jitera-anchor-dont-touch: columns
    difficulty { 'easy' }
    time { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
    descriptions { Faker::Lorem.paragraph_by_chars(number: rand(0..1000)) }
    title { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }

    trait :normal do
      difficulty { 'normal' }
    end

    trait :challenging do
      difficulty { 'challenging' }
    end
  end
end
