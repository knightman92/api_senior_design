FactoryGirl.define do
  factory :question do
    # title { Faker::Lorem.word }
    # created_by { Faker::Number.number(10) }
    category { Faker::Number.number(1)}
    age_range { Faker::Number.number(1)}
    gender { Faker::Number.number(1)}
    question_type { Faker::Number.number(1)}
    options { Faker::Lorem.word }
    question_text { Faker::Lorem.word }

    association :coach, factory: :coach
    association :player, factory: :player

  end
end