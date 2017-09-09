FactoryGirl.define do
  factory :coach do
    # title { Faker::Lorem.word }
    # created_by { Faker::Number.number(10) }
    first_name { Faker::Lorem.word}
    last_name { Faker::Lorem.word}
    email { Faker::Lorem.word}
    encrypted_password { Faker::Lorem.word}
    phone { Faker::Lorem.word}

  end
end