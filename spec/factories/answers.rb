FactoryGirl.define do
  factory :answer do
    # title { Faker::Lorem.word }
    # created_by { Faker::Number.number(10) }
    answer { Faker::Lorem.word}
    association :player, factory: :player
    association :question, factory: :question

  end
end