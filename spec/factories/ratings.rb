FactoryBot.define do
  factory :rating do
    amount { 1 }
    user_id { 1 }
    recipe_id { 1 }
    comment { "MyText" }
  end
end
