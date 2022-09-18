FactoryBot.define do
  factory :rating do
    amount { 5 }
    association :recipe
    association :user
    comment { Faker::Lorem.paragraph }

    trait :one do
      amount { 1 }
    end

    trait :two do
      amount { 2 }
    end

    trait :three do
      amount { 3 }
    end

    trait :four do
      amount { 4 }
    end

    trait :five do
      amount { 5 }
    end
  end
end
