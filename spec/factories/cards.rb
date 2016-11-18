FactoryGirl.define do
  factory :board do
    title   { Faker::Lorem.sentence(2) }

  trait :active do
    active true
  end

  trait :inactive do
    active false
  end
end
end
