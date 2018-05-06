FactoryBot.define do
  factory :location do
    latitude 22
    longitude 33

    trait :invalid do
      latitude nil
      longitude nil
    end
  end
end
