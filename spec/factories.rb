FactoryGirl.define do
  factory :quiz do
    title       { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
  end

  factory :question do
    body        { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
  end
end
