FactoryGirl.define do
  factory :notification do
    # title { Faker::Lorem.word }
    # created_by { Faker::Number.number(10) }
    message { Faker::Lorem.word}
    category { Faker::Number.number(1)}
    association :player, factory: :player
    association :question, factory: :question
    text {Faker::Lorem.word}

  end
end